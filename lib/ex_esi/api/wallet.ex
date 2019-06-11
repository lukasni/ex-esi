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
    "/#{@version}/corporation/#{corporation_id}/wallets/"
    |> API.get()
  end

  @version "v1"
  def journal(%Character{id: character_id}, page \\ 1) when is_integer(page) do
    "/#{@version}/character/#{character_id}/wallet/journal/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def transactions(%Character{id: character_id}, from_id \\ nil) do
    params =
      case from_id do
        nil -> %{}
        id -> %{"from_id" => id}
      end

    "/#{@version}/character/#{character_id}/wallet/transactions/"
    |> API.get("", params)
  end

  @version "v1"
  def corp_journal(%Corporation{id: corporation_id}, division, page \\ 1) do
    "/#{@version}/corporation/#{corporation_id}/wallets/#{division}/journal/"
    |> API.get("", %{"page" => page})
  end

  @version "v1"
  def corp_transactions(%Corporation{id: corporation_id}, division, page \\ 1) do
    "/#{@version}/corporation/#{corporation_id}/wallets/#{division}/transactions/"
    |> API.get("", %{"page" => page})
  end
end
