defmodule Aoc.Day6 do
  def main do
    input()
    |> String.trim("\n")
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
    # |> Enum.take(-2)
    |> call_new_day
    |> length()
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

  def call_new_day(lanternfish) do
    call_new_day(lanternfish, 1)
  end

  def call_new_day(fish, 81), do: fish
  def call_new_day(fish, day) do
    new_fish = parse_timer(fish)
    call_new_day(new_fish, day + 1)
  end

  def parse_timer(fish) do
    {next_day_fish, new_day_fish} =
      Enum.reduce(fish, {[], []}, fn each_fish, {new_fish, addition_array} ->
        if each_fish == 0 do
          {new_fish ++ [6], addition_array ++ [8]}
        else
          next_day = each_fish - 1
          {new_fish ++ [next_day], addition_array}
        end
      end)
    next_day_fish ++ new_day_fish
  end
end



# input = "3,4,3,1,2"
IO.inspect Aoc.Day6.main
