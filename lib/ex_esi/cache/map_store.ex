defmodule ExEsi.Cache.MapStore do
  use GenServer

  @behaviour ExEsi.Cache

  @name __MODULE__

  @expire_every :timer.minutes(5)

  # Client API

  def start(_args \\ []) do
    GenServer.start(__MODULE__, %{}, name: @name)
  end

  def start_link(_args \\ []) do
    GenServer.start_link(__MODULE__, %{}, name: @name)
  end

  @impl ExEsi.Cache
  def get(key) do
    GenServer.call(@name, {:get, key})
  end

  @impl ExEsi.Cache
  def set(key, value, expires) do
    GenServer.cast(@name, {:set, key, value, expires})
  end

  @impl ExEsi.Cache
  def drop(key) do
    GenServer.cast(@name, {:drop, key})
  end

  # Server Callbacks

  @impl GenServer
  def init(args) do
    schedule_expire()
    {:ok, args}
  end

  @impl GenServer
  def handle_cast({:set, key, value, expires}, state) do
    {:noreply, Map.put(state, key, %{expires: expires, value: value})}
  end

  def handle_cast({:drop, key}, state) do
    {:noreply, Map.delete(state, key)}
  end

  @impl GenServer
  def handle_call({:get, key}, _from, state) do
    with result when not is_nil(result) <- Map.get(state, key),
         true <- Timex.after?(result.expires, DateTime.utc_now())
    do
      {:reply, Map.get(state, key).value, state}
    else
      nil -> {:reply, nil, state}
      false ->
        {:reply, nil, Map.delete(state, key)}
    end
  end

  @impl GenServer
  def handle_info(:clean_expired, state) do
    new_state =
      state
      |> Stream.filter(fn {_key, %{expires: expires}} -> Timex.after?(expires, DateTime.utc_now()) end)
      |> Enum.into(%{})

    schedule_expire()
    {:noreply, new_state}
  end

  defp schedule_expire() do
    Process.send_after(self(), :clean_expired, @expire_every)
  end
end
