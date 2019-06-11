defmodule ExEsi.API.PlanetaryInteraction do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v1"
  def planets(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/planets/"
    |> API.get()
  end

  @version "v3"
  def planets(%Character{id: character_id}, planet_id) do
    "/#{@version}/characters/#{character_id}/planets/#{planet_id}/"
    |> API.get()
  end

  @version "v1"
  def customs_offices(%Corporation{id: corporation_id}) do
    "/#{@version}/corporations/#{corporation_id}/customs_offices/"
    |> API.get()
  end

  @version "v1"
  def schematics(schematic_id) do
    "/#{@version}/universe/schematics/#{schematic_id}/"
    |> API.get()
  end
end
