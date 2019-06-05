defmodule ExEsi.Request.Url do
  def build(operation, config) do
    "#{config.esi_base_url}#{operation.path}"
  end
end
