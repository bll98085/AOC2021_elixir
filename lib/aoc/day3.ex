defmodule Aoc.Day3 do
  def main do
    input()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, "", trim: true))
    |> transpose
    |> parse
    |> join
    |> decimal
  end

  def input do
    Path.expand("../source", __DIR__)
    |> Path.join("input3.txt")
    |> File.read
    |> handle_file
  end

  def handle_file({:ok, val}) do
    val
  end

  def handle_file({:error, reason}) do
    reason
  end

  def transpose(row) do
    row
    |> List.zip
  end

  def parse(split_val) do
    split_val
    |> Enum.map(&parse_val(&1))
  end
  def parse_val(val) do
    total = Enum.count(val)
    gamma = Enum.count(val, fn x -> x== "1" end)
    case gamma > total/2 do
      :true -> 1
      :false -> 0
    end
  end

  def reverse(val) do
    if val == 0, do: 1, else: 0
  end

  def join(gamma) do
    epsilon = gamma |> Enum.map(&reverse(&1))
    {Enum.join(gamma), Enum.join(epsilon)}
  end

  def decimal({gam, eps}) do
    x= elem(Integer.parse(gam, 2), 0)
    y= elem(Integer.parse(eps, 2), 0)
    x * y
  end
end

IO.inspect Aoc.Day3.main
