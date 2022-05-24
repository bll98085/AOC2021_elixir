defmodule ParserTest do
  use ExUnit.Case
  doctest Aoc.Day1
  alias Aoc.Day1

  test "test day1"
  foo = [1,2,3,4,5,6,7,8,9,10]
  parser = Day1.meansure(foo, 5, 0)
  assert parser == 9
end
