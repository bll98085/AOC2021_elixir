defmodule Aoc.Day4 do
  def main(rep) do
    [mark, table1, table2, table3]=
      rep |> String.split("\n\n", trim: true)
    form_table(table1)
  end

  def form_table(table) do
    table
    |> String.replace("  ", " ")
    |> String.replace("\n ", "\n")
    |> String.split("\n", trim: true)
    |> Enum.flat_map(fn line ->
      line
      |> String.split(" ", trim: true)
      |> Enum.map(&String.to_integer(&1))
      # |> Enum
    end)
    |> Enum.chunk_every(5)

  end


  # Enum.all?([
  #   diag1 = for i <- 0..4, do: Enum.at(Enum.at(hor_lines, i), i),
  #   Enum.map_every(arr, 5)   # 使用每 5 個去做 func
  # ])


end

report =
"7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7"

IO.inspect Aoc.Day4.main(report)
