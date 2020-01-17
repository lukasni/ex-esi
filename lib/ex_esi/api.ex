defmodule ExEsi.API do
  def request(path, method, data \\ "", params \\ %{}, headers \\ []) do
    %ExEsi.Operation.JSON{
      http_method: method,
      path: path,
      data: data,
      params: params,
      headers: headers
    }
  end

  def get(path, data \\ "", params \\ %{}, headers \\ []) do
    request(path, :get, data, params, headers)
  end

  def post(path, data \\ "", params \\ %{}, headers \\ []) do
    request(path, :post, data, params, headers)
  end

  def put(path, data \\ "", params \\ %{}, headers \\ []) do
    request(path, :put, data, params, headers)
  end

  def delete(path, data \\ "", params \\ %{}, headers \\ []) do
    request(path, :delete, data, params, headers)
  end
end
