defmodule ExEsi.API.Bookmarks do
  @moduledoc false

  alias ExEsi.API

  @version "v2"
  def character(character_id, page) do
    "/#{@version}/#{character_id}/bookmarks/"
    |> API.get("", %{"page" => page})
  end

  @version "v2"
  def character_folders(character_id, page) do
    "/#{@version}/#{character_id}/bookmarks/folders/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def corporation(corporation_id, page) do
    "/#{@version}/#{corporation_id}/bookmarks/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def corporation_folders(corporation_id, page) do
    "/#{@version}/#{corporation_id}/bookmarks/folders/"
    |> API.get("", %{"page" => page})
  end
end
