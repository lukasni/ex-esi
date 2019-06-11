defmodule ExEsi.API.Sovereignty do
  @moduledoc false

  alias ExEsi.API

  @version "v1"
  def campaigns() do
    "/#{@version}/sovereignty/campaigns/"
    |> API.get()
  end

  @version "v1"
  def map() do
    "/#{@version}/sovereignty/map/"
    |> API.get()
  end

  @version "v1"
  def structures() do
    "/#{@version}/sovereignty/structures/"
    |> API.get()
  end
end
