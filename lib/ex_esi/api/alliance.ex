defmodule ExEsi.API.Alliance do
  alias ExEsi.API

  @namespace "alliances"

  @version "v1"
  def list() do
    "/#{@version}/#{@namespace}/"
    |> API.get()
  end

  @version "v3"
  def info(alliance_id) do
    "/#{@version}/#{@namespace}/#{alliance_id}/"
    |> API.get()
  end

  @version "v1"
  def corporations(alliance_id) do
    "/#{@version}/#{@namespace}/#{alliance_id}/corporations/"
    |> API.get()
  end

  @version "v1"
  def icons(alliance_id) do
    "/#{@version}/#{@namespace}/#{alliance_id}/icons/"
    |> API.get()
  end
end
