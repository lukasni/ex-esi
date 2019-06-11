defmodule ExEsi.API.Clones do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.Character

  @version "v3"
  @spec list(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def list(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/clones/"
    |> API.get()
  end

  @version "v1"
  @spec implants(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def implants(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/implants/"
    |> API.get()
  end
end
