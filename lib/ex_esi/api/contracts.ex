defmodule ExEsi.API.Contracts do
  @moduledoc false
  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v1"
  def list(subject, page \\ 1)

  def list(%Character{id: character_id}, page) do
    "/#{@version}/characters/#{character_id}/contracts/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def list(%Corporation{id: corporation_id}, page) do
    "/#{@version}/corporations/#{corporation_id}/contracts/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def bids(subject, page \\ 1)

  def bids(%Character{id: character_id}, contract_id) do
    "/#{@version}/characters/#{character_id}/contracts/#{contract_id}/bids/"
    |> API.get()
  end

  @version "v1"
  def bids(%Corporation{id: corporation_id}, contract_id, page) do
    "/#{@version}/corporations/#{corporation_id}/contracts/#{contract_id}/bids/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def items(%Character{id: character_id}, contract_id) do
    "/#{@version}/characters/#{character_id}/contracts/#{contract_id}/items/"
    |> API.get()
  end

  @version "v1"
  def items(%Corporation{id: corporation_id}, contract_id) do
    "/#{@version}/corporations/#{corporation_id}/contracts/#{contract_id}/items/"
    |> API.get()
  end

  @version "v1"
  def public(region_id) do
    "/#{@version}/contracts/public/#{region_id}/"
    |> API.get()
  end

  @version "v1"
  def public_bids(contract_id, page \\ 1) do
    "/#{@version}/contracts/public/bids/#{contract_id}/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def public_items(contract_id, page \\ 1) do
    "/#{@version}/contracts/public/items/#{contract_id}/"
    |> API.get("", %{"page" => page})
  end
end
