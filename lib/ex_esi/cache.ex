defmodule ExEsi.Cache do
  @callback get(term) :: term
  @callback set(term, term, DateTime.t()) :: :ok | :error
  @callback drop(term) :: :ok | :error
end
