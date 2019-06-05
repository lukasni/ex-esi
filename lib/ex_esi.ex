defmodule ExEsi do
  use Application

  @behaviour ExEsi.Behaviour

  @impl ExEsi.Behaviour
  def request(op, config_override \\ []) do
    ExEsi.Operation.perform(op, ExEsi.Config.new(config_override))
  end

  @impl Application
  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: ExEsi.Worker.start_link(arg)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExEsi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
