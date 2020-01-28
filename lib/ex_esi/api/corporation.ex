defmodule ExEsi.API.Corporation do
  alias ExEsi.API

  @namespace "corporations"

  @type t :: %__MODULE__{
    id: integer
  }
  defstruct id: 0

  @version "v4"
  def info(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/"
    |> API.get()
    |> API.put_after_parse(&Map.put(&1, "id", corporation_id))
  end

  @version "v2"
  def alliance_history(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/alliancehistory/"
    |> API.get()
  end

  @version "v2"
  def blueprints(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/blueprints/"
    |> API.get()
  end

  @version "v2"
  def container_logs(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/containers/logs/"
    |> API.get()
  end

  @version "v1"
  def division(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/divisions/"
    |> API.get()
  end

  @version "v1"
  def facilities(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/facilities/"
    |> API.get()
  end

  @version "v1"
  def icons(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/icons/"
    |> API.get()
  end

  @version "v1"
  def medals(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/medals/"
    |> API.get()
  end

  @version "v1"
  def medals_issued(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/medals/issued/"
    |> API.get()
  end

  @version "v3"
  def members(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/members/"
    |> API.get()
  end

  @version "v1"
  def members_limit(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/members/limit/"
    |> API.get()
  end

  @version "v1"
  def members_titles(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/members/titles/"
    |> API.get()
  end

  @version "v1"
  def membertracking(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/membertracking/"
    |> API.get()
  end

  @version "v1"
  def roles(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/roles/"
    |> API.get()
  end

  @version "v1"
  def roles_history(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/roles/history/"
    |> API.get()
  end

  @version "v1"
  def shareholders(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/shareholders/"
    |> API.get()
  end

  @version "v1"
  def standings(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/standings/"
    |> API.get()
  end

  @version "v1"
  def starbases(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/starbases/"
    |> API.get()
  end

  @version "v1"
  def starbase_details(%__MODULE__{id: corporation_id}, starbase_id, system_id) do
    "/#{@version}/#{@namespace}/#{corporation_id}/starbases/#{starbase_id}/"
    |> API.get()
    |> API.put_param("system_id", system_id)
  end

  @version "v3"
  def structures(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/structures/"
    |> API.get()
  end

  @version "v1"
  def titles(%__MODULE__{id: corporation_id}) do
    "/#{@version}/#{@namespace}/#{corporation_id}/titles/"
    |> API.get()
  end

  @version "v1"
  def npc_corporations() do
    "/#{@version}/#{@namespace}/npccorps/"
    |> API.get()
  end

  def search(name, strict \\ true) do
    API.Search.public(name, [:corporation], strict)
  end
end
