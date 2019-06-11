defmodule ExEsi.API.UserInterface do
  @moduledoc false

  alias ExEsi.API

  @version "v2"
  @spec set_waypoint(integer, boolean, boolean) :: ExEsi.Operation.JSON.t()
  def set_waypoint(destination_id, clear_other \\ false, add_to_beginning \\ false) do
    params = %{
      "destination_id" => destination_id,
      "clear_other_waypoints" => clear_other,
      "add_to_beginning" => add_to_beginning
    }

    "/#{@version}/ui/autopilot/waypoint/"
    |> API.post("", params)
  end

  @version "v1"
  @spec open_contract_window(integer) :: ExEsi.Operation.JSON.t()
  def open_contract_window(contract_id) do
    "/#{@version}/ui/openwindow/contract/"
    |> API.post("", %{"contract_id" => contract_id})
  end

  @version "v1"
  @spec open_info_window(integer) :: ExEsi.Operation.JSON.t()
  def open_info_window(target_id) do
    "/#{@version}/ui/openwindow/information/"
    |> API.post("", %{"target_id" => target_id})
  end

  @version "v1"
  @spec market_details(integer) :: ExEsi.Operation.JSON.t()
  def market_details(type_id) do
    "/#{@version}/ui/openwindow/marketdetails/"
    |> API.post("", %{"type_id" => type_id})
  end

  # TODO: New Mail Window
end
