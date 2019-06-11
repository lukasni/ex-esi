defmodule ExEsi.API.Loyalty do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.Character

  @version "v1"
  @spec points(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def points(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/loyalty/points/"
    |> API.get()
  end

  @version "v1"
  @spec offers(integer) :: ExEsi.Operation.JSON.t()
  def offers(corporation_id) do
    "/#{@version}/loyalty/stores/#{corporation_id}/offers/"
    |> API.get()
  end
end
