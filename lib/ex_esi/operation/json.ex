defmodule ExEsi.Operation.JSON do
  defstruct http_method: :get,
            path: "/",
            data: "",
            params: %{},
            headers: [],
            stream_builder: nil
end

defimpl ExEsi.Operation, for: ExEsi.Operation.JSON do
  # @type response_t :: %{} | ExEsi.Request.error_t

  def perform(operation, config) do
    url = ExEsi.Request.Url.build(operation, config)

    headers = operation.headers

    ExEsi.Request.request(operation.http_method, url, operation.data, headers, config)
    |> parse(config)
  end

  def stream!(%ExEsi.Operation.JSON{stream_builder: nil}, _) do
    raise ArgumentError, """
    This operation does not support streaming
    """
  end

  def stream!(%ExEsi.Operation.JSON{stream_builder: fun}, config) when is_function(fun, 1) do
    fun.(config)
  end

  defp parse({:error, result}, _config), do: {:error, result}
  defp parse({:ok, %{body: "", headers: headers}}, _config), do: {:ok, %{}, meta(headers)}

  defp parse({:ok, %{body: body, headers: headers}}, config) do
    {:ok, config[:json_codec].decode!(body), meta(headers)}
  end

  defp meta(headers) do
    %{pages: List.keyfind(headers, "X-Pages", 0, 1)}
  end
end
