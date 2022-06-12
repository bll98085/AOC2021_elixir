defmodule Aoc.Day1_part2 do
  def main do
    input_txt()
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.to_integer(&1)))  # 算次數，不用轉 integer
    |> call_chunk
    |> meansure
  end

  def input_txt do
    Path.expand("../source", __DIR__)
    |> Path.join("input1.txt")
    |> File.read
    |> handle_file
  end

  def call_chunk(arr) do
    chunk_list =
      arr
      |> Enum.chunk_every(3, 1)
      |> Enum.map(&Enum.sum/1)
    chunk_list ++ [List.last(arr)]
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

IO.inspect Aoc.Day1_part2.main
