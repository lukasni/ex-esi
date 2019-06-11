defmodule ExEsi.API.Dogma do
  @moduledoc false

  alias ExEsi.API

  @version "v1"
  def attributes() do
    "/#{@version}/dogma/attributes/"
    |> API.get()
  end

  @version "v1"
  def attributes(attribute_id) do
    "/#{@version}/dogma/attributes/#{attribute_id}/"
    |> API.get()
  end

  @version "v1"
  def attributes(item_id, type_id) do
    "/#{@version}/dogma/dynamic/items/#{type_id}/#{item_id}/"
    |> API.get()
  end

  @version "v1"
  def effects() do
    "/#{@version}/dogma/effects/"
    |> API.get()
  end

  @version "v2"
  def effects(effect_id) do
    "/#{@version}/dogma/effects/#{effect_id}/"
    |> API.get()
  end
end
