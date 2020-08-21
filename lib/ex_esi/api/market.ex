defmodule ExEsi.API.Market do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v2"
  @spec orders(ExEsi.API.Character.t() | ExEsi.API.Corporation.t()) ::
          ExEsi.Operation.JSON.t()
  def orders(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/orders/"
    |> API.get()
  end

  @version "v3"
  def orders(%Corporation{id: corporation_id}) do
    "/#{@version}/corporations/#{corporation_id}/orders/"
    |> API.get("")
  end

  @spec history(ExEsi.API.Character.t() | ExEsi.API.Corporation.t()) ::
          ExEsi.Operation.JSON.t()
  def history(subject)

  @version "v1"
  def history(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/orders/history/"
    |> API.get()
  end

  @version "v2"
  def history(%Corporation{id: corporation_id}) do
    "/#{@version}/corporations/#{corporation_id}/orders/history/"
    |> API.get()
  end

  @version "v1"
  def region_history(region_id, type_id) do
    "/#{@version}/markets/#{region_id}/history/"
    |> API.get()
    |> API.put_param("type_id", type_id)
  end

  @version "v1"
  @spec region_orders(integer) :: ExEsi.Operation.JSON.t()
  def region_orders(region_id) do
    "/#{@version}/markets/#{region_id}/orders/"
    |> API.get()
  end

  @spec region_orders(integer, integer, :buy | :sell | :all) ::
          ExEsi.Operation.JSON.t()
  def region_orders(region_id, type_id, order_type) do
    "/#{@version}/markets/#{region_id}/orders/"
    |> API.get("", %{"type_id" => type_id, "order_type" => order_type})
  end

  @version "v1"
  def active_types(region_id) do
    "/#{@version}/markets/#{region_id}/types/"
    |> API.get()
  end

  @version "v1"
  def groups() do
    "/#{@version}/markets/groups/"
    |> API.get()
  end

  @version "v1"
  def groups(market_group_id) do
    "/#{@version}/markets/groups/#{market_group_id}/"
    |> API.get()
  end

  @version "v1"
  def prices() do
    "/#{@version}/markets/prices/"
    |> API.get()
  end

  @version "v1"
  def structure_orders(structure_id) do
    "/#{@version}/markets/structures/#{structure_id}/"
    |> API.get()
  end
end
