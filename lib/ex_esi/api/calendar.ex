defmodule ExEsi.API.Calendar do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.Character

  @type rsvp :: :accepted | :declined | :tentative

  @version "v1"
  @spec list_events(ExEsi.API.Character.t(), nil | integer) :: ExEsi.Operation.JSON.t()
  def list_events(%Character{id: character_id}, from_id) do
    params =
      case from_id do
        nil -> %{}
        from_id when is_integer(from_id) -> %{"from_event" => from_id}
      end

    "/#{@version}/characters/#{character_id}/calendar/"
    |> API.get("", params)
  end

  @version "v3"
  @spec event(ExEsi.API.Character.t(), integer) :: ExEsi.Operation.JSON.t()
  def event(%Character{id: character_id}, event_id) do
    "/#{@version}/characters/#{character_id}/calendar/#{event_id}/"
    |> API.get()
  end

  @version "v3"
  @spec rsvp(ExEsi.API.Character.t(), integer, rsvp) :: ExEsi.Operation.JSON.t()
  def rsvp(%Character{id: character_id}, event_id, response) do
    "/#{@version}/characters/#{character_id}/calendar/#{event_id}/"
    |> API.put(%{"response" => response})
  end

  @version "v1"
  @spec event_attendees(ExEsi.API.Character.t(), any) :: ExEsi.Operation.JSON.t()
  def event_attendees(%Character{id: character_id}, event_id) do
    "/#{@version}/characters/#{character_id}/calendar/#{event_id}/attendees/"
    |> API.get()
  end
end
