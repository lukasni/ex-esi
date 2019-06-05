defmodule ExEsi.API.Character do
  alias ExEsi.API

  @namespace "characters"

  @version "v4"
  def info(character_id) do
    "/#{@version}/#{@namespace}/#{character_id}/"
    |> API.get()
  end

  @version "v1"
  def agents_research(character_id) do
    "/#{@version}/#{@namespace}/#{character_id}/agents_research/"
    |> API.get()
  end

  @version "v2"
  def blueprints(character_id) do
    "/#{@version}/characters/#{character_id}/blueprints/"
    |> API.get()
  end

  @version "v2"
  def roles(character_id) do
    "/#{@version}/#{@namespace}/#{character_id}/roles/"
    |> API.get()
  end

  @version "v1"
  def titles(character_id) do
    "/#{@version}/#{@namespace}/#{character_id}/titles/"
    |> API.get()
  end

  def search(name, strict \\ true) do
    API.Search.public(name, [:character], strict)
  end
end
