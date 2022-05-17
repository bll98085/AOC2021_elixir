defmodule Aoc.Day4 do
  def main(rep) do
    [mark_num | table] =
      rep |> String.split("\n\n")
    bingo_start(parse_mark(mark_num), get_tables(table))
    # get_tables(table)
  end

  def parse_mark(val) do
    val
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  defp get_tables(data) do
    data
    |> Enum.map(&get_table/1)
    |> zip_table
  end

  defp get_table(board) do
    # parse_board =
      board
      |> String.replace("  ", " ")
      |> String.replace("\n ", "\n")
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.split(" ", trim: true)
        |> Enum.map(&String.to_integer/1)
      end)
  end

  def zip_table(val) do
    val
    |> Enum.map(fn board ->
        board ++ (board |> List.zip |> Enum.map(&Tuple.to_list/1))
      end)
    |> Enum.map(&call_index(&1))
  end

  def call_index(b) do
    b |> Enum.map(&Enum.with_index(&1, 1))
  end




  def bingo_start(mark, board) do
    fin_score =
      Enum.reduce(mark, board, fn(mark_value, b) ->
        # IO.inspect b
        fin_val = filter_board(b)
      # if blank?(fin_val), do: {:cont, first_map_row(b, mark_value)}, else: {:halt, fin_val}
        if blank?(fin_val), do: first_map_row(b, mark_value), else: fin_val
      end)

    # parse_score= fin_score |> List.flatten |> Enum.map(&elem(&1, 0))     #[14, 21, 17, 24, 4]

    # Enum.sum(unmark_number(mark, parse_score))
    # 將 tuple 值拯救出來，然後將呼叫值取出我要的，取最後一位在相乘
    # IO.inspect {Enum.sum(mark), Enum.sum(unmark_num), Enum.sum(win_number)}
  end

  def unmark_number(t, []), do: t
  def unmark_number([h | t], p) do
    unmark_number(t, list_delete(p, h))
  end
  def list_delete(p, h) do
    List.delete(p, h)
  end

  # 原本預計使用 all? 來判斷
  # def check_board(board) do
    #   Enum.all?(board, fn({_, y}) -> y!= 0 end)
    # end

  def first_map_row([], _), do: []
  def first_map_row([h | t], mark_value) do
    IO.inspect
    Enum.map(h,
      fn (map_b) -> sec_map_row(map_b, mark_value)
    end)
    first_map_row(t, mark_value)
  end

  def sec_map_row(row, mark_value) do
    Enum.map(row, fn {map_r, is_mark} ->
      case mark_value == map_r do
        :true -> {map_r, 0}
        :false -> {map_r, is_mark}
      end
    end)
  end

  def filter_board([]), do: []
  def filter_board([h |t]) do
    for board <- h, Enum.all?(board, fn {_, mark}-> mark == 0 end), do: board
    filter_board(t)
  end

  def blank?([]), do: true
  def blank?(_), do: false


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

# IO.inspect Aoc.Day4.blank?([])

# input value -> mark_num, board, 將 board 做 parse 然後排列成每一列和 zip 後的每一列全部放一起
# call arr of arr 來對輸入狀態調整, 對每一列的 value check, 如果完成，則中止 reduce




  # -------- call arr of arr---------------------
# defmodule DeepMap do
#   def deep_map(list, fun) when is_list(list) do
#       Enum.map(list, fn(x) -> deep_map(x, fun) end)
#   end

#   def deep_map(not_list, fun) do
#       fun.(not_list)
#   end
# end
