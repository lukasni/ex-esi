defmodule ExEsi.API.Killmails do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v1"
  def recent(%Character{id: character_id}, page) do
    "/#{@version}/characters/#{character_id}/killmails/recent/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def recent(%Corporation{id: corporation_id}, page) do
    "/#{@version}/corporations/#{corporation_id}/killmails/recent/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def get(killmail_id, killmail_hash) do
    "/#{@version}/killmails/#{killmail_id}/#{killmail_hash}/"
  end
end
