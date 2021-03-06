defmodule Aoc.Day1 do
  def main do
    input_txt()
    |> String.split("\n", trim: true)
    # |> Enum.map(&(String.trim(&1, " ")))
    # |> String.replace("\r", "")
    |> Enum.map(&(String.to_integer(&1)))  # 算次數，不用轉 integer
    |> meansure
  end

  def input_txt do
    Path.expand("../source", __DIR__)
    |> Path.join("input1.txt")
    |> File.read
    |> handle_file
  end

  def handle_file({:ok, content}) do
    content
  end

  def handle_file({:error, reason}) do
    reason
  end

  def meansure([h | t]) do
    meansure(t, h, 0)
  end
  def meansure([], _, acc), do: acc
  def meansure([h | t], prev, acc) do
    if h > prev do
      meansure(t, h, acc+ 1)
    else
      meansure(t, h, acc)
    end
  end
end

IO.inspect Aoc.Day1.main
