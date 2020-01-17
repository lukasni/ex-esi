defmodule ExEsi.Cache.ETSStore do
  use GenServer

  @behaviour ExEsi.Cache

  @name __MODULE__

  @expire_every :timer.minutes(5)

  # Client API

  def start(default \\ []) do
    GenServer.start(__MODULE__, default, name: @name)
  end

  def start_link(default \\ []) do
    GenServer.start_link(__MODULE__, default, name: @name)
  end

  def get(key) do
    GenServer.call(@name, {:get, key})
  end

  def set(key, value, expires) do
    GenServer.cast(@name, {:set, key, value, expires})
  end

  def drop(key) do
    GenServer.cast(@name, {:drop, key})
  end

  # Server Callbacks

  def init(_) do
    schedule_expire()
    {:ok, :ets.new(__MODULE__, [])}
  end

  def handle_cast({:set, key, value, expires}, state) do
    :ets.insert(state, {key, value, DateTime.to_unix(expires)})
    {:noreply, state}
  end

  def handle_cast({:drop, key}, state) do
    :ets.delete(state, key)
    {:noreply, state}
  end

  def handle_call({:get, key}, _from, state) do
    case :ets.lookup(state, key) do
      [{^key, value, expires}] -> {:reply, result_or_nil(value, expires), state}
      [] -> {:reply, nil, state}
    end
  end

  def handle_info(:clean_expired, state) do
    ts = DateTime.utc_now() |> DateTime.to_unix()
    state
    |> :ets.select_delete([{{:_, :_, :"$1"}, [{:<, :"$1", ts}], [true]}])

    schedule_expire()
    {:noreply, state}
  end

  defp result_or_nil(value, expires) do
    if not expired?(expires), do: value
  end

  defp expired?(expires) do
    expires < DateTime.to_unix(DateTime.utc_now())
  end

  defp schedule_expire() do
    Process.send_after(self(), :clean_expired, @expire_every)
  end
end
