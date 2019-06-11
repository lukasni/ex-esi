defmodule ExEsi.API.Industry do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v1"
  def jobs(subject, include_completed \\ false, page \\ 1)

  def jobs(%Character{id: character_id}, include_completed, _page) do
    "/#{@version}/characters/#{character_id}/industry/jobs/"
    |> API.get("", %{"include_completed" => include_completed})
  end

  @version "v1"
  def jobs(%Corporation{id: corporation_id}, include_completed, page) do
    "/#{@version}/corporations/#{corporation_id}/industry/jobs/"
    |> API.get("", %{"include_completed" => include_completed, "page" => page})
  end

  @version "v1"
  def mining_ledger(%Character{id: character_id}, page) do
    "/#{@version}/characters/#{character_id}/mining/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def moon_extractions(%Corporation{id: corporation_id}, page) do
    "/#{@version}/corporation/#{corporation_id}/mining/extractions/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def mining_observers(%Corporation{id: corporation_id}, page) do
    "/#{@version}/corporation/#{corporation_id}/mining/observers/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def observed_mining(%Corporation{id: corporation_id}, observer_id, page) do
    "/#{@version}/corporation/#{corporation_id}/mining/observers/#{observer_id}/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def facilities() do
    "/#{@version}/industry/facilities/"
    |> API.get()
  end

  @version "v1"
  def systems() do
    "/#{@version}/industry/systems/"
    |> API.get()
  end
end
