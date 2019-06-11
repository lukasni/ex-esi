defmodule ExEsi.API.Opportunities do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.Character

  @version "v1"
  def completed(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/opportunities/"
    |> API.get()
  end

  @version "v1"
  def groups() do
    "/#{@version}/opportunities/groups/"
    |> API.get()
  end

  @version "v1"
  def groups(group_id) do
    "/#{@version}/opportunities/groups/#{group_id}/"
    |> API.get()
  end

  @version "v1"
  def tasks() do
    "/#{@version}/opportunities/tasks/"
    |> API.get()
  end

  @version "v1"
  def tasks(task_id) do
    "/#{@version}/opportunities/tasks/#{task_id}/"
    |> API.get()
  end
end
