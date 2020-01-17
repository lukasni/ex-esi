defmodule ExEsi.API.Bookmarks do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v2"
  @spec list(ExEsi.API.Character.t() | ExEsi.API.Corporation.t()) ::
          ExEsi.Operation.JSON.t()
  def list(%Character{id: character_id}) do
    "/#{@version}/#{character_id}/bookmarks/"
    |> API.get()
  end

  @version "v1"
  def list(%Corporation{id: corporation_id}) do
    "/#{@version}/#{corporation_id}/bookmarks/"
    |> API.get()
  end

  @version "v2"
  @spec folders(ExEsi.API.Character.t() | ExEsi.API.Corporation.t()) ::
          ExEsi.Operation.JSON.t()
  def folders(%Character{id: character_id}) do
    "/#{@version}/#{character_id}/bookmarks/folders/"
    |> API.get()
  end

  @version "v1"
  def folders(%Corporation{id: corporation_id}) do
    "/#{@version}/#{corporation_id}/bookmarks/folders/"
    |> API.get()
  end
end
