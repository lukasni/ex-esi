defmodule ExEsi.API.Wars do
  @moduledoc false

  alias ExEsi.API

  @version "v1"
  def list() do
    "/#{@version}/wars/"
    |> API.get()
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
