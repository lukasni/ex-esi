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
    params = "flag=#{flag}"

    params =
      case avoid do
        [] -> params
        list when is_list(list) -> "&avoid=" <> Enum.join(list, ",")
      end

    params =
      case connections do
        [] ->
          params

        list when is_list(list) ->
          "&connections=" <> (Enum.map(connections, &format_connection/1) |> Enum.join(","))
      end

    "/#{@version}/route/#{origin}/#{destination}/"
    |> API.get("", params)
  end

  defp format_connection(%Connection{bidirectional: true} = conn) do
    "#{conn.origin}|#{conn.destination},#{conn.destination}|#{conn.origin}"
  end

  defp format_connection(%Connection{bidirectional: false} = conn) do
    "#{conn.origin}|#{conn.destination}"
  end
end
