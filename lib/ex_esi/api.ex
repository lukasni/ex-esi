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

  # def auth_get(path, token, data \\ "", params \\ %{}, headers \\ []) do
  #   headers = auth_headers(headers, token)

  #   get(path, data, params, headers)
  # end

  # def auth_post(path, token, data \\ "", params \\ %{}, headers \\ []) do
  #   headers = auth_headers(headers, token)

  #   post(path, data, params, headers)
  # end

  # defp auth_headers(headers, token) do
  #   headers |> List.keystore("Authorization", 0, {"Authorization", "Bearer #{token}"})
  # end
end
