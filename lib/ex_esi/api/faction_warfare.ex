defmodule ExEsi.API.FactionWarfare do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v1"
  def stats(%Character{id: character_id}) do
    "/#{@version}/character/#{character_id}/fw/stats/"
    |> API.get()
  end

  @version "v1"
  def stats(%Corporation{id: corporation_id}) do
    "/#{@version}/corporation/#{corporation_id}/fw/stats/"
    |> API.get()
  end

  @version "v1"
  def faction_leaderboards() do
    "/#{@version}/fw/leaderboards/"
    |> API.get()
  end

  @version "v1"
  def character_leaderboards() do
    "/#{@version}/fw/leaderboards/characters/"
    |> API.get()
  end

  @version "v1"
  def corporation_leaderboards() do
    "/#{@version}/fw/leaderboards/corporations/"
    |> API.get()
  end

  @version "v1"
  def stats() do
    "/#{@version}/fw/stats/"
    |> API.get()
  end

  @version "v2"
  def systems() do
    "/#{@version}/fw/systems/"
    |> API.get()
  end

  @version "v1"
  def wars() do
    "/#{@version}/fw/wars/"
    |> API.get()
  end
end
