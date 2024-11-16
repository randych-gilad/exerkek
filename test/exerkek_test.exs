defmodule ExerkekTest do
  use ExUnit.Case
  doctest Exerkek

  test "greets the world" do
    assert Exerkek.hello() == :world
  end
end
