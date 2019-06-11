defmodule ExEsi.API.Market do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v2"
  @spec orders(ExEsi.API.Character.t() | ExEsi.API.Corporation.t(), pos_integer) ::
          ExEsi.Operation.JSON.t()
  def orders(subject, page \\ 1)

  def orders(%Character{id: character_id}, _page) do
    "/#{@version}/characters/#{character_id}/orders/"
    |> API.get()
  end

  @version "v3"
  def orders(%Corporation{id: corporation_id}, page) do
    "/#{@version}/corporations/#{corporation_id}/orders/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  @spec history(ExEsi.API.Character.t() | ExEsi.API.Corporation.t(), pos_integer) ::
          ExEsi.Operation.JSON.t()
  def history(subject, page \\ 1)

  def history(%Character{id: character_id}, page) do
    "/#{@version}/characters/#{character_id}/orders/history/"
    |> API.get("", %{"page" => page})
  end

  @version "v2"
  def history(%Corporation{id: corporation_id}, page) do
    "/#{@version}/corporations/#{corporation_id}/orders/history/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def region_history(region_id, type_id) do
    "/#{@version}/markets/#{region_id}/history/"
    |> API.get("", %{"type_id" => type_id})
  end

  @version "v1"
  @spec region_orders(integer, pos_integer) :: ExEsi.Operation.JSON.t()
  def region_orders(region_id, page \\ 1) do
    "/#{@version}/markets/#{region_id}/orders/"
    |> API.get("", %{"page" => page})
  end

  @spec region_orders(integer, integer, :buy | :sell | :all, pos_integer) ::
          ExEsi.Operation.JSON.t()
  def region_orders(region_id, type_id, order_type, page \\ 1) do
    "/#{@version}/markets/#{region_id}/orders/"
    |> API.get("", %{"page" => page, "type_id" => type_id, "order_type" => order_type})
  end

  @version "v1"
  def active_types(region_id, page \\ 1) do
    "/#{@version}/markets/#{region_id}/types/"
    |> API.get("", %{"page" => page})
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
  def structure_orders(structure_id, page \\ 1) do
    "/#{@version}/markets/structures/#{structure_id}/"
    |> API.get("", %{"page" => page})
  end
end
