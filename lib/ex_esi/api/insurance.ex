defmodule ExEsi.API.Insurance do
  @moduledoc false

  alias ExEsi.API

  @version "v1"
  def prices() do
    "/#{@version}/insurance/prices/"
    |> API.get()
  end
end
