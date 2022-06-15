defmodule Aoc.Day7 do
  def main do
    parse_input =
      input()
      |> String.trim("\n")
      |> String.split(",", trim: true)
      |> Enum.map(&String.to_integer/1)
    Enum.max(parse_input)
    each_crabs_fuel = for index <- 0..(Enum.max(parse_input)), do: get_fuel(parse_input, index)
    Enum.min(each_crabs_fuel) |> trunc
  end

  def input do
    Path.expand("../source", __DIR__)
    |> Path.join("input7.txt")
    |> File.read
    |> handle_file
  end

  def handle_file({:ok, content}) do
    content
  end
  def handle_file({:error, reason}) do
    reason
  end

  def get_fuel(each_crabs, index) do
    each_crabs |> Enum.map(&(expotential(abs(index - &1)))) |> Enum.sum
  end

  def expotential(val) do
    val* (val+1) /2
  end
end


# input = "16,1,2,0,4,2,7,1,2,14"

IO.inspect Aoc.Day7.main
