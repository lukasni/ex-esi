defmodule ExEsi.API.Corporation do
  alias ExEsi.API

  @namespace "corporations"

  @version "v4"
  def info(corporation_id) do
    "/#{@version}/#{@namespace}/#{corporation_id}/"
    |> API.get()
  end

  @version "v2"
  def alliance_history(corporation_id) do
    "/#{@version}/#{@namespace}/#{corporation_id}/alliancehistory/"
    |> API.get()
  end

  @version "v2"
  def blueprints(corporation_id, token) do
    "/#{@version}/#{@namespace}/#{corporation_id}/blueprints/"
    |> API.auth_get(token)
  end

  @version "v2"
  def container_logs(corporation_id, token) do
    "#{@version}/#{@namespace}/#{corporation_id}/containers/logs/"
    |> API.auth_get(token)
  end
end
