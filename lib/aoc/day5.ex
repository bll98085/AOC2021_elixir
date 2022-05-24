defmodule Aoc.Day5 do
  def main(val) do
    lines =
      val
      |> String.split("\n", trim: true)
      |> Enum.map(fn x ->
          x
          |> String.split(" -> ")
          |> Enum.map(&String.split(&1, ","))
          |> Enum.flat_map(fn x -> Enum.map(x, fn y -> String.to_integer(y) end) end)
          |> List.to_tuple()
        end)
    call_line(lines)
  end

  def call_line(arr) do
    Enum.map(arr, fn {x1, x2, y1, y2} ->
      {x1, x2, y1, y2}
    end)
  end
end

input =
"0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2"

IO.inspect Aoc.Day5.main(input)
