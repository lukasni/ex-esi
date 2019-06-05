defmodule ExEsi.API.Calendar do
  @moduledoc false

  alias ExEsi.API

  @rsvp [
    "accepted",
    "declined",
    "tentative"
  ]

  @version "v1"
  def list_events(character_id, from_id) do
    params =
      case from_id do
        nil -> %{}
        from_id when is_number(from_id) -> %{"from_event" => from_id}
      end

    "/#{@version}/characters/#{character_id}/calendar/"
    |> API.get("", params)
  end

  @version "v3"
  def event(character_id, event_id) do
    "/#{@version}/characters/#{character_id}/calendar/#{event_id}/"
    |> API.get()
  end

  @version "v3"
  def rsvp(character_id, event_id, response) when response in @rsvp do
    "/#{@version}/characters/#{character_id}/calendar/#{event_id}/"
    |> API.put(%{"response" => response})
  end

  @version "v1"
  def event_attendees(character_id, event_id) do
    "/#{@version}/characters/#{character_id}/calendar/#{event_id}/attendees/"
    |> API.get()
  end
end
