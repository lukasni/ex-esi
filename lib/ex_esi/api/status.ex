defmodule ExEsi.API.Status do
  @moduledoc false

  alias ExEsi.API

  @version "v1"
  def status() do
    "/#{@version}/status/"
    |> API.get()
  end
end
