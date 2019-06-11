defmodule ExEsi.API.Incursions do
  @moduledoc false

  alias ExEsi.API

  @version "v1"
  def list() do
    "/#{@version}/incursions/"
    |> API.get()
  end
end
