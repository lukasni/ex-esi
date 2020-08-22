defmodule ExEsi.Request.Finch do
  alias ExEsi.Request.HttpClient
  @behaviour HttpClient

  @impl HttpClient
  def request(method, url, body \\ "", headers \\ [], http_opts \\ []) do
    name = Application.get_env(:ex_esi, :finch_opts)[:name] || ExEsiClient

    request = Finch.build(method, url, headers, body)

    case Finch.request(request, name) do
      {:ok, %{status: status, headers: headers, body: body}} ->
        {:ok,
         %{
           status_code: status,
           headers: HttpClient.normalize_headers(headers),
           body: body
         }}

      {:error, reason} ->
        {:error, %{reason: reason}}
    end
  end
end
