defmodule ExEsi.API.Fleets do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.Character

  @version "v2"
  def current_fleet(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/fleet/"
    |> API.get()
  end

  @version "v1"
  def details(fleet_id) do
    "/#{@version}/fleets/#{fleet_id}/"
    |> API.get()
  end

  @version "v1"
  def update_settings(fleet_id, settings) do
    data = Map.new(settings) |> Map.take([:is_free_move, :motd])

    "/#{@version}/fleets/#{fleet_id}/"
    |> API.put(data)
  end

  @version "v1"
  def members(fleet_id) do
    "/#{@version}/fleets/#{fleet_id}/members/"
    |> API.get()
  end

  @version "v1"
  def invite(fleet_id, invitee_id, :fleet_commander) do
    %{
      "character_id" => invitee_id,
      "role" => "fleet_commander"
    }
    |> invite(fleet_id)
  end

  def invite(fleet_id, invitee_id, :squad_member) do
    %{
      "character_id" => invitee_id,
      "role" => "squad_member"
    }
    |> invite(fleet_id)
  end

  def invite(fleet_id, invitee_id, :wing_commander, wing_id) do
    %{
      "character_id" => invitee_id,
      "role" => "wing_commander",
      "wing_id" => wing_id
    }
    |> invite(fleet_id)
  end

  def invite(fleet_id, invitee_id, :squad_commander, wing_id, squad_id) do
    %{
      "character_id" => invitee_id,
      "role" => "squad_commander",
      "wing_id" => wing_id,
      "squad_id" => squad_id
    }
    |> invite(fleet_id)
  end

  def invite(fleet_id, invitee_id, :squad_member, wing_id, squad_id) do
    %{
      "character_id" => invitee_id,
      "role" => "squad_member",
      "wing_id" => wing_id,
      "squad_id" => squad_id
    }
    |> invite(fleet_id)
  end

  defp invite(data, fleet_id) do
    "/#{@version}/fleets/#{fleet_id}/members/"
    |> API.post(data)
  end

  def kick(fleet_id, member_id) do
    "/#{@version}/fleets/#{fleet_id}/members/#{member_id}/"
    |> API.delete()
  end

  # TODO: Figure out a way to handle fleet updates and invites more gracefully. Maybe use structs? Don't enforce format at all?
  @version "v1"
  def move(fleet_id, member_id, movement) do
    "/#{@version}/fleets/#{fleet_id}/members/#{member_id}/"
    |> API.put(movement)
  end

  @version "v1"
  def delete_squad(fleet_id, squad_id) do
    "/#{@version}/fleets/#{fleet_id}/squads/#{squad_id}/"
    |> API.delete()
  end

  @version "v1"
  def rename_squad(fleet_id, squad_id, name) do
    "/#{@version}/fleets/#{fleet_id}/squads/#{squad_id}/"
    |> API.put(%{"name" => name})
  end

  @version "v1"
  def wings(fleet_id) do
    "/#{@version}/fleets/#{fleet_id}/wings/"
    |> API.get()
  end

  @version "v1"
  def create_wing(fleet_id) do
    "/#{@version}/fleets/#{fleet_id}/wings/"
    |> API.post()
  end

  @version "v1"
  def delete_wing(fleet_id, wing_id) do
    "/#{@version}/fleets/#{fleet_id}/wings/#{wing_id}/"
    |> API.delete()
  end

  @version "v1"
  def rename_wing(fleet_id, wing_id, name) do
    "/#{@version}/fleets/#{fleet_id}/wings/#{wing_id}/"
    |> API.put(%{"name" => name})
  end

  @version "v1"
  def create_squad(fleet_id, wing_id) do
    "/#{@version}/fleets/#{fleet_id}/wings/#{wing_id}/squads/"
    |> API.post()
  end
end
