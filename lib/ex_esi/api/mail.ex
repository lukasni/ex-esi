defmodule ExEsi.API.Mail do
  @moduledoc false

  alias ExEsi.API
  alias ExEsi.API.Character

  @type recipient_type :: :alliance | :character | :corporation | :mailing_list
  @type recipient :: %{recipient_type: recipient_type, recipient_id: integer}

  @version "v1"
  def headers(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/mail/"
    |> API.get()
  end

  def headers(%Character{} = character, labels) do
    headers(character)
    |> API.put_param("labels", Enum.join(labels, ","))
  end

  @version "v1"
  @spec body(ExEsi.API.Character.t(), integer) :: ExEsi.Operation.JSON.t()
  def body(%Character{id: character_id}, mail_id) do
    "/#{@version}/characters/#{character_id}/mail/#{mail_id}/"
    |> API.get()
  end

  @version "v3"
  @spec labels(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def labels(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/mail/labels/"
    |> API.get()
  end

  @version "v1"
  @spec lists(ExEsi.API.Character.t()) :: ExEsi.Operation.JSON.t()
  def lists(%Character{id: character_id}) do
    "/#{@version}/characters/#{character_id}/mail/lists/"
    |> API.get()
  end

  @version "v1"
  @spec send(ExEsi.API.Character.t(), binary, binary, list(recipient), integer) ::
          ExEsi.Operation.JSON.t()
  def send(%Character{id: character_id}, subject, body, recipients, approved_cost \\ 0) do
    payload = %{
      "approved_cost" => approved_cost,
      "body" => body,
      "subject" => subject,
      "recipients" => recipients
    }

    "/#{@version}/characters/#{character_id}/mail/"
    |> API.post(payload)
  end

  @version "v1"
  @spec delete(ExEsi.API.Character.t(), integer) :: ExEsi.Operation.JSON.t()
  def delete(%Character{id: character_id}, mail_id) do
    "/#{@version}/characters/#{character_id}/mail/#{mail_id}/"
    |> API.delete()
  end

  @version "v1"
  @spec mark_read(ExEsi.API.Character.t(), integer, boolean) :: ExEsi.Operation.JSON.t()
  def mark_read(%Character{id: character_id}, mail_id, read \\ true) do
    "/#{@version}/characters/#{character_id}/mail/#{mail_id}/"
    |> API.post(%{"read" => read})
  end

  @spec set_labels(ExEsi.API.Character.t(), binary, list(integer)) :: ExEsi.Operation.JSON.t()
  def set_labels(%Character{id: character_id}, mail_id, label_ids) do
    "/#{@version}/characters/#{character_id}/mail/#{mail_id}/"
    |> API.post(%{"labels" => label_ids})
  end

  @version "v2"
  @spec create_label(ExEsi.API.Character.t(), binary, binary) :: ExEsi.Operation.JSON.t()
  def create_label(%Character{id: character_id}, name, color \\ "#ffffff") do
    "/#{@version}/characters/#{character_id}/mail/labels/"
    |> API.post(%{"color" => color, "name" => name})
  end

  @version "v1"
  @spec delete_label(ExEsi.API.Character.t(), integer) :: ExEsi.Operation.JSON.t()
  def delete_label(%Character{id: character_id}, label_id) do
    "/#{@version}/characters/#{character_id}/mail/labels/#{label_id}/"
    |> API.delete()
  end
end
