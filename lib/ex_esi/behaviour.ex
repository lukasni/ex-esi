defmodule ExEsi.Behaviour do
  @callback request(ExEsi.Operation.t()) :: {:ok, term} | {:error, term}
  @callback request(ExEsi.Operation.t(), Keyword.t()) :: {:ok, term} | {:error, term}
end
