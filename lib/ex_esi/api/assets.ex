defmodule ExEsi.API.Assets do
  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v3"
  @spec list(ExEsi.API.Character.t() | ExEsi.API.Corporation.t(), integer) ::
          ExEsi.Operation.JSON.t()
  def list(%Character{id: character_id}, page) do
    "/#{@version}/characters/#{character_id}/assets/"
    |> API.get("", %{"page" => page})
  end

  @version "v3"
  def list(%Corporation{id: corporation_id}, page) do
    "/#{@version}/corporations/#{corporation_id}/assets/"
    |> API.get("", %{"page" => page})
  end

  @version "v2"
  @spec locations(ExEsi.API.Character.t() | ExEsi.API.Corporation.t(), list) ::
          ExEsi.Operation.JSON.t()
  def locations(%Character{id: character_id}, item_ids) do
    "/#{@version}/characters/#{character_id}/assets/locations/"
    |> API.post(item_ids)
  end

  @version "v2"
  def locations(%Corporation{id: corporation_id}, item_ids) do
    "/#{@version}/corporations/#{corporation_id}/assets/locations/"
    |> API.post(item_ids)
  end

  @version "v1"
  @spec names(ExEsi.API.Character.t() | ExEsi.API.Corporation.t(), list) ::
          ExEsi.Operation.JSON.t()
  def names(%Character{id: character_id}, item_ids) do
    "/#{@version}/characters/#{character_id}/assets/names/"
    |> API.post(item_ids)
  end

  @version "v1"
  def names(%Corporation{id: corporation_id}, item_ids) do
    "/#{@version}/corporations/#{corporation_id}//assets/names/"
    |> API.post(item_ids)
  end
end
