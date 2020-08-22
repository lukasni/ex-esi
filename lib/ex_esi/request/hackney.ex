defmodule ExEsi.Request.Hackney do
  alias ExEsi.Request.HttpClient
  @behaviour HttpClient

  @default_opts [recv_timeout: 30_000]

  @impl HttpClient
  def request(method, url, body \\ "", headers \\ [], http_opts \\ []) do
    opts = Application.get_env(:ex_esi, :hackney_ops, @default_opts)
    opts = http_opts ++ [:with_body | opts]

    case :hackney.request(method, url, headers, body, opts) do
      {:ok, status, headers} ->
        {:ok, %{status_code: status, headers: HttpClient.normalize_headers(headers)}}

      {:ok, status, headers, body} ->
        {:ok, %{status_code: status, headers: HttpClient.normalize_headers(headers), body: body}}

      {:error, reason} ->
        {:error, %{reason: reason}}
    end
  end
end
