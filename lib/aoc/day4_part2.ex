defmodule Aoc.Day4_part2 do
  def main do
    [mark_num | table] =
      input_txt()
      |> String.split("\n\n", trim: true)
      bingo_start(parse_mark(mark_num), List.last(get_tables(table)))
    # {parse_mark(mark_num), get_tables(table)}
    # List.last(get_tables(table))
  end

  def input_txt do
    Path.expand("../source", __DIR__)
    |> Path.join("input4.txt")
    |> File.read
    |> handle_file
  end

  def handle_file({:ok, content}) do
    content
  end
  def handle_file({:error, reason}) do
    reason
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
    |> Enum.map(&List.to_tuple([0, &1]))
  end
  defp get_table(board) do
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


  def get_unmark_total(board) do
    get_unmark_total(board, 0)
  end
  def get_unmark_total([], acc), do: acc
  def get_unmark_total([{val, is_mark} | t], acc) do
    case is_mark == 0 do
      :true -> get_unmark_total(t, acc)
      :false -> get_unmark_total(t, acc+ val)
    end
  end

  def get_last_mark(arr, val) do
    new_list =
      Enum.reduce_while(arr, [], fn a, new_list ->
        case a != val do
          :true -> {:cont, new_list ++ [a]}
          :false -> {:halt, new_list}
        end
      end)
    List.last(new_list)
  end


  def unmark_number(t, []), do: t
  def unmark_number([h | t], p) do
    unmark_number(t, list_delete(p, h))
  end
  def list_delete(p, h) do
    List.delete(p, h)
  end

# [1,2,3,4,5,6,7,8,9,10]
# [
#   {0, a},
#   {1, b},
#   {2, c}
# ]

  # mark
  # |> map todo board
  #   {a},{b},{c}
  #   |> list [h | t, [empty]]
  #     |> check a,b,c bingo
  #     h |> each find value value
  #     everytime concat each board

  def bingo_start(mark, board) do
    Enum.reduce(mark, {1, board, []}, fn(mark_value, {index, all_board, bingo_arr}) ->

      # mark_board(mark, index, board, bingo)
      # Return (index, unmark_board, bingo_arr)

      case blank?(all_board) do
        :true -> mark_board(mark_value, index, all_board, bingo_arr)
        :false -> {index, all_board, bingo_arr}
      end
    end)


    # last value * unmarknum
    # catch mark_value -> {end_val, board} = mark_value
    # get_unmark_total(List.flatten(board)) * get_last_mark(mark, end_val)

    # Enum.sum(unmark_number(mark, parse_score))
    # 將 tuple 值拯救出來，然後將呼叫值取出我要的，取最後一位在相乘
    # IO.inspect {Enum.sum(mark), Enum.sum(unmark_num), Enum.sum(win_number)}
  end

  def mark_board(mark, index, board, bingo) do
    newboard = mark_board(mark, board)
    {index_now, bingo_board} = check_bingo(index, newboard, [])
    case blank?(bingo_board) do
      :true -> {index_now, unmark_board(bingo_board, board), [bingo] ++ [bingo_board]}
      :false -> {index, board, bingo}
    end
  end

  def unmark_board(bingo, board) do
    Enum.reduce(bingo, board, fn bin, b ->
      List.delete(b, bin)
    end)
  end

  def check_bingo(index, [], bingo_board), do: {index, bingo_board}
  def check_bingo(index, [{val, h} | t], bingo_board) do
    if check_bingo_row(h)
      do check_bingo(index + 1, t, bingo_board ++ [{index, Enum.drop(h, -5)}])
    else check_bingo(index, t, bingo_board) end
  end

  def check_bingo_row({val, board}) do
    Enum.any?(board, fn row -> is_bingo(row) end)
  end
  def is_bingo(val) do
    Enum.all?(val, fn {_, mark}-> mark == 0 end)
  end

# {0,
#  [
#    [{27, 1}, {18, 2}, {39, 3}, {0, 4}, {48, 5}],
#    [{84, 1}, {74, 2}, {64, 3}, {80, 4}, {60, 5}],
#    [{28, 1}, {96, 2}, {37, 3}, {65, 4}, {57, 5}],
#    [{53, 1}, {79, 2}, {89, 3}, {32, 4}, {14, 5}],
#    [{55, 1}, {63, 2}, {50, 3}, {7, 4}, {62, 5}],
#    [{27, 1}, {84, 2}, {28, 3}, {53, 4}, {55, 5}],
#    [{18, 1}, {74, 2}, {96, 3}, {79, 4}, {63, 5}],
#    [{39, 1}, {64, 2}, {37, 3}, {89, 4}, {50, 5}],
#    [{0, 1}, {80, 2}, {65, 3}, {32, 4}, {7, 5}],
#    [{48, 1}, {60, 2}, {57, 3}, {14, 4}, {62, 5}]
#  ]
# }

  def mark_board(board, mark) do
    mark_board(board, mark, [])
  end
  def mark_board([], _, b), do: b
  def mark_board([{val, h} | t], mark, fin_b) do
    table = Enum.map(h, fn {row} ->
      sec_map_row(row, mark)
    end)
    mark_board(t, mark, fin_b ++ [{val, table}])
  end
  def sec_map_row(row, mark_value) do
    Enum.map(row, fn {map_r, is_mark} ->
      case mark_value == map_r do
        :true -> {map_r, 0}
        :false -> {map_r, is_mark}
      end
    end)
  end

  def blank?([]), do: true
  def blank?(_), do: false
end


IO.inspect Aoc.Day4_part2.main

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
