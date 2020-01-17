defmodule ExEsi.API.Contacts do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.{Alliance, Character, Corporation}

  @contact_params [
    :standing,
    :label_ids,
    :watched
  ]

  @version "v2"
  def list(%Alliance{id: alliance_id}) do
    "/#{@version}/alliances/#{alliance_id}/contacts/"
    |> API.get()
  end

  @version "v2"
  def list(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/contacts/"
    |> API.get()
  end

  @version "v2"
  def list(%Corporation{id: corporation_id}) do
    "/#{@version}/corporations/#{corporation_id}/contacts/"
    |> API.get()
  end

  @version "v1"
  def labels(%Alliance{id: alliance_id}) do
    "/#{@version}/alliances/#{alliance_id}/contacts/labels/"
    |> API.get()
  end

  @version "v1"
  def labels(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/contacts/labels/"
    |> API.get()
  end

  @version "v1"
  def labels(%Corporation{id: corporation_id}) do
    "/#{@version}/corporations/#{corporation_id}/contacts/labels/"
    |> API.get()
  end

  @version "v2"
  def delete(%Character{id: character_id}, contact_ids) do
    ids = Enum.join(contact_ids, ",")

    "/#{@version}/characters/#{character_id}/contacts/"
    |> API.delete()
    |> API.put_param("contact_ids", ids)
  end

  @version "v2"
  def bulk_add(%Character{id: character_id}, contact_ids, standing, extra_params \\ []) do
    params =
      Map.new(extra_params)
      |> Map.put(:standing, standing)
      |> Map.take(@contact_params)

    "/#{@version}/characters/#{character_id}/contacts/"
    |> API.post(contact_ids, params)
  end

  @version "v2"
  def bulk_edit(%Character{id: character_id}, contact_ids, standing, extra_params \\ []) do
    params =
      Map.new(extra_params)
      |> Map.put(:standing, standing)
      |> Map.take(@contact_params)

    "/#{@version}/characters/#{character_id}/contacts/"
    |> API.put(contact_ids, params)
  end
end
