defmodule Aoc.Day6Part2 do
  def main(day) do
    initial_list = for x <- 0..8, do: %{x => 0}
    convert_initial_list =
      Enum.reduce(initial_list, fn val, fin ->
        Map.merge(fin, val)
      end)
    parse_input =
      input()
      |> String.trim("\n")
      |> String.split(",", trim: true)
      |> Enum.map(&String.to_integer/1)
    call_process(parse_input, convert_initial_list, day)
    |> Map.values
    |> Enum.sum
  end

  def input do
    Path.expand("../source", __DIR__)
    |> Path.join("input6.txt")
    |> File.read
    |> handle_file
  end

  def handle_file({:ok, content}) do
    content
  end

  def handle_file({:error, reason}) do
    reason
  end

  def call_process(input, initial, day) do
    convert_input =
      Enum.group_by(input, fn x-> x end)
      |> Enum.map(fn {timer, val} -> %{timer=> length(val)} end)
      |> Enum.reduce(fn val, fin -> Map.merge(val, fin) end)
    first_day = Map.merge(initial, convert_input)

    call_process(first_day, day)
  end

  def call_process(today, 0), do: today
  def call_process(today, day) do
    [h | t] = Map.values(today)
    next_day =
      put_val(today, t, 0)
      |> Map.put(8, h)
      |> Map.update!(6, &(&1 + h))
    call_process(next_day, day-1)
  end

  def put_val(val, [], _), do: val
  def put_val(today, [h | t], index) do
    put_val(Map.put(today, index, h), t, index + 1)
  end
end



# input = "3,4,3,1,2"

IO.inspect Aoc.Day6Part2.main(256)
