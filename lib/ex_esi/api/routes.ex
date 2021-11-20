defmodule ExEsi.API.Routes do
  @moduledoc false

  alias ExEsi.API

  defmodule Connection do
    @enforce_keys [:origin, :destination]
    defstruct [
      :origin,
      :destination,
      bidirectional: true
    ]

    @type t :: %__MODULE__{
            origin: non_neg_integer,
            destination: non_neg_integer,
            bidirectional: boolean
          }
  end

  @type security_preference :: :shortest | :secure | :insecure

  @version "v1"
  @spec route(integer, integer, security_preference, list(integer), list(Connection.t())) ::
          ExEsi.Operation.JSON.t()
  def route(origin, destination, flag \\ :shortest, avoid \\ [], connections \\ []) do
    params =
      %{}
      |> put_flag(flag)
      |> put_avoid(avoid)
      |> put_connections(connections)

    "/#{@version}/route/#{origin}/#{destination}/"
    |> API.get("", params)
  end

  defp put_flag(params, flag) do
    Map.put(params, "flag", to_string(flag))
  end

  defp put_avoid(params, []), do: params
  defp put_avoid(params, avoid) do
    Map.put(params, "avoid", Enum.join(avoid, ","))
  end

  defp put_connections(params, []), do: params
  defp put_connections(params, connections) do
    Map.put(
      params,
      "connections",
      Enum.map(connections, &format_connection/1) |> Enum.join(",")
    )
  end

  defp format_connection(%Connection{bidirectional: true} = conn) do
    "#{conn.origin}|#{conn.destination},#{conn.destination}|#{conn.origin}"
  end

  defp format_connection(%Connection{bidirectional: false} = conn) do
    "#{conn.origin}|#{conn.destination}"
  end
end
