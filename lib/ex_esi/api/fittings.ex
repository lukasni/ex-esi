defmodule ExEsi.API.Fittings do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.Character

  @version "v2"
  def get(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/fittings/"
    |> API.get()
  end

  @version "v2"
  def add(%Character{id: character_id}, fitting) do
    "/#{@version}/characters/#{character_id}/fittings/"
    |> API.post(fitting)
  end

  @version "v2"
  def delete(%Character{id: character_id}, fitting_id) do
    "/#{@version}/characters/#{character_id}/fittings/#{fitting_id}/"
    |> API.delete()
  end
end
