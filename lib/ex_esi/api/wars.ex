defmodule ExEsi.API.Wars do
  @moduledoc false

  alias ExEsi.API

  @version "v1"
  def list(max_war_id \\ nil) do
    params =
      case max_war_id do
        nil -> %{}
        id -> %{"max_war_id" => id}
      end

    "/#{@version}/wars/"
    |> API.get("", params)
  end

  @version "v1"
  def info(war_id) do
    "/#{@version}/wars/#{war_id}/"
    |> API.get()
  end

  @version "v1"
  def killmails(war_id) do
    "/#{@version}/wars/#{war_id}/killmails/"
    |> API.get()
  end
end
