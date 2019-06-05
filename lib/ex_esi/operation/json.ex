defmodule ExEsi.Operation.JSON do
  defstruct http_method: :get,
            path: "/",
            data: %{},
            params: %{},
            headers: []
end

defimpl ExEsi.Operation, for: ExEsi.Operation.JSON do
  #@type response_t :: %{} | ExEsi.Request.error_t

  def perform(operation, config) do
    url = ExEsi.Request.Url.build(operation, config)

    headers = operation.headers

    ExEsi.Request.request(operation.http_method, url, operation.data, headers, config)
    |> parse(config)
  end

  defp parse({:error, result}, _config), do: {:error, result}
  defp parse({:ok, %{body: ""}}, _config), do: {:ok, %{}}

  defp parse({:ok, %{body: body}}, config) do
    {:ok, config[:json_codec].decode!(body)}
  end
end
