defmodule ExEsi.Operation.JSON do
  @type t :: %__MODULE__{
          http_method: ExEsi.Request.HttpClient.http_method(),
          path: String.t(),
          data: String.t(),
          params: Map.t(),
          headers: Keyword.t(),
          stream_builder: function() | nil,
          after_parse: function() | nil
        }
  defstruct http_method: :get,
            path: "/",
            data: "",
            params: %{},
            headers: [],
            stream_builder: nil,
            after_parse: nil
end

defimpl ExEsi.Operation, for: ExEsi.Operation.JSON do
  # @type response_t :: %{} | ExEsi.Request.error_t

  require Logger

  def perform(operation, config) do
    url = ExEsi.Request.Url.build(operation, config)

    headers = operation.headers

    case cached_request(operation.http_method, url, config) do
      nil ->
        ExEsi.Request.request(operation.http_method, url, operation.data, headers, config)
        |> cache(operation.http_method, url, config)

      result ->
        result
    end
    |> parse(operation, config)
  end

  def stream!(%ExEsi.Operation.JSON{stream_builder: nil}, _) do
    raise ArgumentError, """
    This operation does not support streaming
    """
  end

  def stream!(%ExEsi.Operation.JSON{stream_builder: fun}, config) when is_function(fun, 1) do
    fun.(config)
  end

  defp cached_request(method, url, config) do
    case config[:cache].get({method, url}) do
      nil ->
        nil

      result ->
        if config[:debug_requests] do
          Logger.debug(
            "ExEsi: Cached Response: #{method |> Atom.to_string() |> String.upcase()} #{
              inspect(url)
            }"
          )
        end

        result
    end
  end

  defp cache({:error, result}, _method, _url, _config), do: {:error, result}

  defp cache({:ok, %{headers: headers}} = response, method, url, config) do
    with {"expires", expires} when is_binary(expires) <- List.keyfind(headers, "expires", 0),
         {:ok, expires} <- Timex.parse(expires, "{RFC1123}") do
      config[:cache].set({method, url}, response, expires)
    end

    response
  end

  defp parse({:error, result}, _operation, _config), do: {:error, result, %{}}

  defp parse({:ok, %{body: "", headers: headers}}, _operation, _config),
    do: {:ok, %{}, meta(headers)}

  defp parse({:ok, %{body: body, headers: headers}}, operation, config) do
    parsed =
      body
      |> config[:json_codec].decode!()

    response =
      case operation.after_parse do
        f when is_function(f) -> f.(parsed)
        _ -> parsed
      end

    {:ok, response, meta(headers)}
  end

  defp meta(headers) do
    with {"x-pages", pages} <- List.keyfind(headers, "x-pages", 0),
         {pages, _rest} <- Integer.parse(pages) do
      %{pages: pages}
    else
      _ ->
        %{}
    end
  end
end
