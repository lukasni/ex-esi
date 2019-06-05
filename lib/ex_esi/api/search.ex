defmodule ExEsi.API.Search do
  alias ExEsi.API

  @public_categories [
    :agent,
    :alliance,
    :character,
    :constellation,
    :corporation,
    :faction,
    :inventory_type,
    :region,
    :solar_system,
    :station
  ]

  @secret_categories [
    :structure
  ]

  @version "v2"
  def public(search, categories, strict \\ false) do
    params = %{
      "search" => search,
      "categories" => filter_categories(categories, :public),
      "strict" => strict
    }

    "/#{@version}/search/"
    |> API.get("", params)
  end

  @version "v3"
  def secret(search, character_id, categories, strict \\ false) do
    params = %{
      "search" => search,
      "categories" => filter_categories(categories, :secret),
      "strict" => strict
    }

    "/#{@version}/characters/#{character_id}/search/"
    |> API.get("", params)
  end

  defp filter_categories(categories, :public) do
    categories
    |> Stream.filter(&Enum.member?(@public_categories, &1))
    |> Stream.map(&Atom.to_string/1)
    |> Stream.map(&String.downcase/1)
    |> Enum.join(",")
  end

  defp filter_categories(categories, :secret) do
    accepted = @public_categories ++ @secret_categories

    categories
    |> Stream.filter(&Enum.member?(accepted, &1))
    |> Stream.map(&Atom.to_string/1)
    |> Stream.map(&String.downcase/1)
    |> Enum.join(",")
  end
end
