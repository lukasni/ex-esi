defmodule ExEsi.API.Skills do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.Character

  @version "v1"
  @spec attributes(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def attributes(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/attributes/"
    |> API.get()
  end

  @version "v2"
  @spec skillqueue(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def skillqueue(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/skillqueue/"
    |> API.get()
  end

  @version "v4"
  @spec skills(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def skills(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/skills/"
    |> API.get()
  end
end
