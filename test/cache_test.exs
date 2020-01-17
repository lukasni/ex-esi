defmodule ExEsiCacheTest do
  use ExUnit.Case
  doctest ExEsi.Cache

  alias ExEsi.Cache.ETSStore, as: Cache

  @data %{
    key: "http:///www.example.com",
    first_value: ~s({"example": "first value"}),
    second_value: ~s({"example": "second value"})
  }

  @future_date DateTime.add(DateTime.utc_now(), 30*60, :second)

  test "It should not hit when empty" do
    {:ok, _} = Cache.start_link
    assert nil == Cache.get("http:///www.example.com")
  end

  test "It should hit after loading a value" do
    Cache.start_link
    Cache.set(@data.key, @data.first_value, @future_date)
    assert @data.first_value == Cache.get("http:///www.example.com")
  end

  test "It should be able to change a value" do
    Cache.start_link
    Cache.set(@data.key, @data.first_value, @future_date)
    Cache.set(@data.key, @data.second_value, @future_date)

    assert @data.second_value == Cache.get(@data.key)
  end

  test "It should expire old keys on get" do
    Cache.start_link
    Cache.set(@data.key, @data.first_value, DateTime.add(DateTime.utc_now(), -30, :second))
    assert nil == Cache.get(@data.key)
  end

  test "It should be able to delete a value" do
    Cache.start_link
    Cache.set(@data.key, @data.first_value, @future_date)
    Cache.drop(@data.key)

    assert nil == Cache.get(@data.key)
  end
end
