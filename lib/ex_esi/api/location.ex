defmodule ExEsi.API.Location do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.Character

  @version "v1"
  @spec location(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def location(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/location/"
    |> API.get()
  end

  @version "v1"
  def online(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/online/"
    |> API.get()
  end

  @version "v1"
  def ship(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/ship/"
    |> API.get()
  end
end
