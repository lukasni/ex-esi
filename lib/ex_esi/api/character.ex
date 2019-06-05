defmodule ExEsi.API.Character do
  alias ExEsi.API

  @namespace "characters"

  @version "v4"
  def info(character_id) do
    "/#{@version}/#{@namespace}/#{character_id}/"
    |> API.get()
  end

  @version "v2"
  def roles(character_id, token) do
    "/#{@version}/#{@namespace}/#{character_id}/roles/"
    |> API.auth_get(token)
  end

  @version "v1"
  def titles(character_id, token) do
    "/#{@version}/#{@namespace}/#{character_id}/titles/"
    |> API.auth_get(token)
  end
end
