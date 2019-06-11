defmodule ExEsi.Request.Url do
  def build(operation, config) do
    base = "#{config.esi_base_url}#{operation.path}"

    case operation.params do
      %{} = params when map_size(params) > 0 -> "#{base}?#{URI.encode_query(params)}"
      params when is_binary(params) -> "#{base}?#{params}"
      _ -> base
    end
  end
end
