defmodule ExEsi.Request.HttpClient do
  @type http_method :: :get | :post | :put | :delete
  @callback request(
              method :: http_method,
              url :: binary,
              req_body :: binary,
              headers :: [{binary, binary}, ...],
              http_opts :: term
            ) :: {:ok, %{status_code: pos_integer, body: binary}} | {:error, %{reason: any}}
end
