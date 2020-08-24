defmodule ExEsi.API.Alliance do
  alias ExEsi.API

  @namespace "alliances"

  @type t :: %__MODULE__{
          id: integer
        }
  defstruct id: 0

  @version "v1"
  @spec list :: ExEsi.Operation.JSON.t()
  def list() do
    "/#{@version}/#{@namespace}/"
    |> API.get()
  end

  @version "v3"
  @spec info(ExEsi.API.Alliance.t()) :: ExEsi.Operation.JSON.t()
  def info(%__MODULE__{id: alliance_id}) do
    "/#{@version}/#{@namespace}/#{alliance_id}/"
    |> API.get()
    |> API.put_after_parse(&Map.put(&1, "id", alliance_id))
  end

  @version "v1"
  @spec corporations(ExEsi.API.Alliance.t()) :: ExEsi.Operation.JSON.t()
  def corporations(%__MODULE__{id: alliance_id}) do
    "/#{@version}/#{@namespace}/#{alliance_id}/corporations/"
    |> API.get()
  end

  @version "v2"
  @spec icons(ExEsi.API.Alliance.t()) :: ExEsi.Operation.JSON.t()
  def icons(%__MODULE__{id: alliance_id}) do
    "/#{@version}/#{@namespace}/#{alliance_id}/icons/"
    |> API.get()
  end

  def search(name, strict \\ true) do
    API.Search.public(name, [:alliance], strict)
    |> API.put_after_parse(&Map.get(&1, "alliance"))
  end
end
