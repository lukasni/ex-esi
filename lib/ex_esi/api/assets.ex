defmodule ExEsi.API.Assets do
  alias ExEsi.API

  @version "v3"
  def character(character_id, page) do
    "/#{@version}/characters/#{character_id}/assets/"
    |> API.get("", %{"page" => page})
  end

  @version "v2"
  def character_locations(character_id, item_ids) do
    "/#{@version}/characters/#{character_id}/assets/locations/"
    |> API.post(item_ids)
  end

  @version "v1"
  def character_names(character_id, item_ids) do
    "/#{@version}/characters/#{character_id}/assets/names/"
    |> API.post(item_ids)
  end

  @version "v3"
  def corporation(corporation_id, page) do
    "/#{@version}/corporations/#{corporation_id}/assets/"
    |> API.get("", %{"page" => page})
  end

  @version "v2"
  def corporation_locations(corporation_id, item_ids) do
    "/#{@version}/corporations/#{corporation_id}/assets/locations/"
    |> API.post(item_ids)
  end

  @version "v1"
  def corporation_names(corporation_id, item_ids) do
    "/#{@version}/corporations/#{corporation_id}//assets/names/"
    |> API.post(item_ids)
  end
end
