defmodule ExEsi.API.Universe do
  @moduledoc false

  alias ExEsi.API

  @version "v1"
  @spec ancestries :: ExEsi.Operation.JSON.t()
  def ancestries() do
    "/#{@version}/universe/ancestries/"
    |> API.get()
  end

  @version "v1"
  @spec asteroid_belts(integer) :: ExEsi.Operation.JSON.t()
  def asteroid_belts(asteroid_belt_id) do
    "/#{@version}/universe/asteroid_belts/#{asteroid_belt_id}/"
    |> API.get()
  end

  @version "v1"
  @spec bloodlines :: ExEsi.Operation.JSON.t()
  def bloodlines() do
    "/#{@version}/universe/bloodlines/"
    |> API.get()
  end

  @version "v1"
  @spec categories :: ExEsi.Operation.JSON.t()
  def categories() do
    "/#{@version}/universe/categories/"
    |> API.get()
  end

  @version "v1"
  @spec categories(integer) :: ExEsi.Operation.JSON.t()
  def categories(category_id) do
    "/#{@version}/universe/categories/#{category_id}/"
    |> API.get()
  end

  @version "v1"
  @spec constellations :: ExEsi.Operation.JSON.t()
  def constellations() do
    "/#{@version}/universe/constellations/"
    |> API.get()
  end

  @version "v1"
  @spec constellations(integer) :: ExEsi.Operation.JSON.t()
  def constellations(constellation_id) do
    "/#{@version}/universe/constellations/#{constellation_id}/"
    |> API.get()
  end

  @version "v2"
  @spec factions :: ExEsi.Operation.JSON.t()
  def factions() do
    "/#{@version}/universe/factions/"
    |> API.get()
  end

  @version "v1"
  @spec graphics :: ExEsi.Operation.JSON.t()
  def graphics() do
    "/#{@version}/universe/graphics/"
    |> API.get()
  end

  @version "v1"
  @spec graphics(integer) :: ExEsi.Operation.JSON.t()
  def graphics(graphic_id) do
    "/#{@version}/universe/graphics/#{graphic_id}/"
    |> API.get()
  end

  @version "v1"
  @spec groups :: ExEsi.Operation.JSON.t()
  def groups() do
    "/#{@version}/universe/groups/"
    |> API.get()
  end

  @version "v1"
  @spec groups(integer) :: ExEsi.Operation.JSON.t()
  def groups(group_id) do
    "/#{@version}/universe/groups/#{group_id}/"
    |> API.get()
  end

  @version "v1"
  @spec ids(list(binary)) :: ExEsi.Operation.JSON.t()
  def ids(names) do
    "/#{@version}/universe/ids/"
    |> API.post(names)
  end

  @version "v1"
  @spec moons(integer) :: ExEsi.Operation.JSON.t()
  def moons(moon_id) do
    "/#{@version}/universe/moons/#{moon_id}/"
    |> API.get()
  end

  @version "v3"
  @spec names(list(integer)) :: ExEsi.Operation.JSON.t()
  def names(ids) do
    "/#{@version}/universe/names/"
    |> API.post(ids)
  end

  @version "v1"
  @spec races :: ExEsi.Operation.JSON.t()
  def races() do
    "/#{@version}/universe/races/"
    |> API.get()
  end

  @version "v1"
  @spec regions :: ExEsi.Operation.JSON.t()
  def regions() do
    "/#{@version}/universe/regions/"
    |> API.get()
  end

  @version "v1"
  @spec regions(integer) :: ExEsi.Operation.JSON.t()
  def regions(region_id) do
    "/#{@version}/universe/regions/#{region_id}/"
    |> API.get()
  end

  @version "v1"
  @spec stargates(integer) :: ExEsi.Operation.JSON.t()
  def stargates(stargate_id) do
    "/#{@version}/universe/stargates/#{stargate_id}/"
    |> API.get()
  end

  @version "v1"
  @spec stars(integer) :: ExEsi.Operation.JSON.t()
  def stars(star_id) do
    "/#{@version}/universe/stars/#{star_id}/"
    |> API.get()
  end

  @version "v2"
  @spec stations(integer) :: ExEsi.Operation.JSON.t()
  def stations(station_id) do
    "/#{@version}/universe/stations/#{station_id}/"
    |> API.get()
  end

  @version "v1"
  @spec structures :: ExEsi.Operation.JSON.t()
  def structures() do
    "/#{@version}/universe/structures/"
    |> API.get()
  end

  @version "v2"
  @spec structures(integer) :: ExEsi.Operation.JSON.t()
  def structures(structure_id) do
    "/#{@version}/universe/structures/#{structure_id}/"
    |> API.get()
  end

  @version "v1"
  @spec system_jumps :: ExEsi.Operation.JSON.t()
  def system_jumps() do
    "/#{@version}/universe/system_jumps/"
    |> API.get()
  end

  @version "v2"
  @spec system_kills :: ExEsi.Operation.JSON.t()
  def system_kills() do
    "/#{@version}/universe/system_kills/"
    |> API.get()
  end

  @version "v1"
  @spec systems :: ExEsi.Operation.JSON.t()
  def systems() do
    "/#{@version}/universe/systems/"
    |> API.get()
  end

  @version "v4"
  @spec systems(integer) :: ExEsi.Operation.JSON.t()
  def systems(system_id) do
    "/#{@version}/universe/systems/#{system_id}/"
    |> API.get()
  end

  @version "v1"
  @spec types :: ExEsi.Operation.JSON.t()
  def types() do
    "/#{@version}/universe/types/"
    |> API.get()
  end

  @version "v3"
  @spec types(integer) :: ExEsi.Operation.JSON.t()
  def types(type_id) do
    "/#{@version}/universe/types/#{type_id}/"
    |> API.get()
  end
end
