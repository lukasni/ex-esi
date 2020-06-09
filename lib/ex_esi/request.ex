defmodule ExEsi.Request do
  require Logger

  @moduledoc """
  Handles requests to ESI
  """

  # @type http_status :: pos_integer
  # @type success_content :: %{body: binary, headers: [{binary, binary}]}
  # @type success_t :: {:ok, success_content}
  # @type error_t :: {:error, {:http_error, http_status, binary}}
  # @type response_t :: success_t | error_t

  def request(http_method, url, data, headers, config) do
    body =
      case data do
        [] -> "{}"
        d when is_binary(d) -> d
        _ -> config[:json_codec].encode!(data)
      end

    request_and_retry(http_method, url, config, headers, body, {:attempt, 1})
  end

  def request_and_retry(_method, _url, _config, _headers, _req_body, {:error, reason}) do
    {:error, reason}
  end

  def request_and_retry(method, url, config, headers, req_body, {:attempt, attempt}) do
    safe_url = url

    full_headers =
      headers
      |> List.keystore("User-Agent", 0, {"User-Agent", Map.get(config, :user_agent)})
      |> auth_headers(config)

    if config[:debug_requests] do
      Logger.debug(
        "ExEsi: Request URL: #{inspect(safe_url)} HEADERS: #{inspect(full_headers)} BODY: #{
          inspect(req_body)
        } ATTEMPT: #{attempt}"
      )
    end

    retry404 = config[:retry404]

    case config[:http_client].request(
           method,
           safe_url,
           req_body,
           full_headers,
           Map.get(config, :http_opts, [])
         ) do
      {:ok, %{status_code: status} = resp} when status in 200..299 or status == 304 ->
        {:ok, resp}

      {:ok, %{status_code: status} = _resp} when status == 301 ->
        Logger.warn("ExEsi: Received redirect")
        {:error, {:http_error, status, "redirected"}}

      {:ok, %{status_code: 404} = resp} when retry404 == false ->
        {:error, {:http_error, 404, Map.get(resp, :body, "not found")}}

      {:ok, %{status_code: 420}} ->
        {:error, {:http_error, 420, "error limit reached"}}

      {:ok, %{status_code: status} = resp} when status != 404 and status in 400..499 ->
        {:error, {:http_error, status, Map.get(resp, :body, "client error")}}

      {:ok, %{status_code: status} = resp} when status >= 500 or retry404 == true ->
        body = Map.get(resp, :body)
        Logger.warn("ExEsi: Server Error #{inspect(status)} - #{inspect(body)}")
        reason = {:http_error, status, body}

        request_and_retry(
          method,
          url,
          config,
          full_headers,
          req_body,
          attempt_again?(attempt, reason, config)
        )

      {:error, %{reason: reason}} ->
        Logger.warn(
          "ExEsi: HTTP ERROR: #{inspect(reason)} for URL: #{inspect(safe_url)} ATTEMPT: #{attempt}"
        )

        request_and_retry(
          method,
          url,
          config,
          full_headers,
          req_body,
          attempt_again?(attempt, reason, config)
        )
    end
  end

  def attempt_again?(attempt, reason, config) do
    if attempt >= config[:retries][:max_attempts] do
      {:error, reason}
    else
      attempt |> backoff(config)
      {:attempt, attempt + 1}
    end
  end

  def backoff(attempt, config) do
    (config[:retries][:base_backoff_in_ms] * :math.pow(2, attempt))
    |> min(config[:retries][:max_backoff_in_ms])
    |> trunc
    |> :rand.uniform()
    |> :timer.sleep()
  end

  defp auth_headers(headers, config) do
    case Map.get(config, :access_token) do
      nil -> headers
      token -> List.keystore(headers, "Authorization", 0, {"Authorization", "Bearer #{token}"})
    end
  end
end
