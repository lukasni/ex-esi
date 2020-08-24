defmodule ExEsi.API.Character do
  alias ExEsi.API

  @namespace "characters"

  @type t :: %__MODULE__{
          id: integer
        }
  defstruct id: 0

  @version "v4"
  @spec info(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def info(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/"
    |> API.get()
    |> API.put_after_parse(&Map.put(&1, "id", character_id))
  end

  @version "v2"
  @spec agents_research(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def agents_research(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/agents_research/"
    |> API.get()
  end

  @version "v3"
  @spec blueprints(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def blueprints(%__MODULE__{id: character_id}) do
    "/#{@version}/characters/#{character_id}/blueprints/"
    |> API.get()
  end

  @version "v2"
  @spec corporation_history(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def corporation_history(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/corporationhistory/"
    |> API.get()
  end

  @version "v5"
  @spec cspa(ExEsi.API.Character.t(), list(integer)) :: ExEsi.Operation.JSON.t()
  def cspa(%__MODULE__{id: character_id}, recipient_ids) do
    "/#{@version}/#{@namespace}/#{character_id}/cspa/"
    |> API.post(recipient_ids)
  end

  @version "v2"
  @spec fatigue(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def fatigue(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/fatigue/"
    |> API.get()
  end

  @version "v2"
  @spec medals(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def medals(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/medals/"
    |> API.get()
  end

  @version "v6"
  @spec notifications(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def notifications(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/notifications/"
    |> API.get()
  end

  @version "v2"
  @spec notifications_contacts(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def notifications_contacts(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/notifications/contacts/"
    |> API.get()
  end

  @version "v3"
  @spec portrait(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def portrait(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/portrait/"
    |> API.get()
  end

  @version "v3"
  @spec roles(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def roles(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/roles/"
    |> API.get()
  end

  @version "v2"
  @spec standings(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def standings(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/standings/"
    |> API.get()
  end

  @version "v2"
  @spec titles(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def titles(%__MODULE__{id: character_id}) do
    "/#{@version}/#{@namespace}/#{character_id}/titles/"
    |> API.get()
  end

  @version "v2"
  @spec affiliation(list(integer)) :: ExEsi.Operation.JSON.t()
  def affiliation(character_ids) do
    "/#{@version}/#{@namespace}/affiliation/"
    |> API.post(character_ids)
  end

  @spec search(binary, boolean) :: ExEsi.Operation.JSON.t()
  def search(name, strict \\ true) do
    API.Search.public(name, [:character], strict)
    |> API.put_after_parse(&Map.get(&1, "character"))
  end
end
