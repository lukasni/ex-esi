defmodule ExEsi.Config do
  @common_config [
    :http_client,
    :debug_requests,
    :json_codec,
    :retries,
    :user_agent,
    :oauth,
    :esi_base_url
  ]

  @default_opts %{
    http_client: ExEsi.Request.Hackney,
    debug_requests: true,
    json_codec: Jason,
    retries: [max_attempts: 10, base_backoff_in_ms: 10, max_backoff_in_ms: 10000],
    user_agent: "ExEsi - User didn't update agent",
    esi_base_url: "https://esi.evetech.net"
  }

  def new(config_overrides \\ []) do
    overrides = Map.new(config_overrides)
    common_config = Application.get_all_env(:ex_esi) |> Map.new() |> Map.take(@common_config)

    @default_opts
    |> Map.merge(common_config)
    |> Map.merge(overrides)
  end
end
