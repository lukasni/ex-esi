defmodule ExEsi.API.Wallet do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.{Character, Corporation}

  @version "v1"
  def wallets(%Character{id: character_id}) do
    "/#{@version}/character/#{character_id}/wallet/"
    |> API.get()
  end

  @version "v1"
  def wallets(%Corporation{id: corporation_id}) do
    "/#{@version}/corporations/#{corporation_id}/wallets/"
    |> API.get()
  end

  @version "v1"
  def journal(%Character{id: character_id})  do
    "/#{@version}/character/#{character_id}/wallet/journal/"
    |> API.get()
  end

  @version "v1"
  def transactions(%Character{id: character_id}) do
    "/#{@version}/character/#{character_id}/wallet/transactions/"
    |> API.get()
  end

  @version "v4"
  def journal(%Corporation{id: corporation_id}, division) do
    "/#{@version}/corporations/#{corporation_id}/wallets/#{division}/journal/"
    |> API.get()
  end

  @version "v1"
  def transactions(%Corporation{id: corporation_id}, division) do
    "/#{@version}/corporations/#{corporation_id}/wallets/#{division}/transactions/"
    |> API.get()
  end
end
