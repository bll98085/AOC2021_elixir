defmodule Aoc.Day5 do
  def main do
    input()
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      x
      |> String.split(" -> ")
      |> Enum.map(&String.split(&1, ","))
      |> Enum.flat_map(fn x -> Enum.map(x, fn y -> String.  to_integer(y) end) end)
        |> List.to_tuple()
      end)
    |> Enum.flat_map(&call_line/1)
    |> Enum.frequencies()
    |> Enum.count(&elem(&1, 1) > 1)
  end

  def input do
    Path.expand("../source", __DIR__)
    |> Path.join("input5.txt")
    |> File.read
    |> handle_file
  end
  def handle_file({:ok, content}) do
    content
  end
  def handle_file({:error, reason}) do
    reason
  end
  def call_line({x1, y1, x2, y2}) do
    cond do
      x1 == x2 -> for y <- y1..y2, do: {x1 , y}
      y1 == y2 -> for x <- x1..x2, do: {x , y1}
      true -> []
    end
  end
end

# input =
# "0,9 -> 5,9
# 8,0 -> 0,8
# 9,4 -> 3,4
# 2,2 -> 2,1
# 7,0 -> 7,4
# 6,4 -> 2,0
# 0,9 -> 2,9
# 3,4 -> 1,4
# 0,0 -> 8,8
# 5,5 -> 8,2"

IO.inspect Aoc.Day5.main
