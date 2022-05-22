
defmodule Test.Sandbox do
  def check(val) do
    val
    # |> Enum.map(&(integer(&1)))
  end

  # def integer([h | t]) do
  #   # IO.inspect t
  #   t |> String.to_integer
  #   [h | t]
  # end

  def hello(rep) do
    rep
    |> Enum.map(&String.graphemes(&1))
    |> transpose
  end

  def transpose(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  # def reduce_value(val) do
  #   board = [{2, 1}, {4,2}]
  #   Enum.reduce(val, board, fn v, b ->
  #     func(v, board)
  #     # case func(v, b) do
  #     #   :true -> :erlang.setelement(v, board, 0)
  #     #   :false -> board
  #     # end
  #   end)
  # end

  # def func(val, b) do
  #   b
  #   |> Enum.map(fn board_val, val ->
  #     case elem(board_val, 0) == val do
  #       :true -> :erlang.setelement(val, board_val, 0)
  #       :false -> board_val
  #     end
  #   end)
  # end

  def reduce_value(val) do
    # board =
    #   [{1, 0}, {3, 0}]
    board =
      [[{1, 1}, {3, 4}],
       [{4, 2}, {5, 3}]
      ]

    # Enum.reduce(val, board, fn v, b ->
    #   b |> Enum.map(
    #     fn {x, y} ->
    #       case x> v do
    #         :true -> {x, y+ v}
    #         :false -> {x, y}
    #       end
    #   end)
    # end)

                # [1,2,3,4,5]
    Enum.reduce(val, board, fn map_v, map_b ->
      Enum.map(map_b, fn(b) -> mul_map(map_v, b) end)
    end)
  end

  def mul_map(v, map_b) do
    Enum.map(map_b, fn{x, y} ->
      case v== x do
        :true -> {x, 0}
        :false -> {x, y}
      end
    end)
  end

  def zoo(x) do
    x *2
  end
  def test_anony(arr) do
    Enum.map(arr, fn x -> zoo(x) end)
  end

  def addToTuple({x, y}), do: {x, y+1}

  # def reduce_test(val) do
  #   Enum.reduce(val, 0, fn x, acc ->
  #     if rem(x, 2) == 1, do: acc + 1
  #   end)
  # end
  # def hello do
  #   foo = {10, 20}
  #   final =
  #     Enum.reduce_while(1..100, foo, fn x, {a, b} ->
  #       if x < 5, do: {:cont, (a + x)}, else: {:halt, (b + x)}
  #     end)
  #   final
  # end

  # def hello do
  #   try do
  #     Enum.each(14..50, fn x ->
  #       if rem(x, 13) == 0, do: throw(x)
  #       end)
  #       "Got nothing"
  #     catch
  #       x -> "Got #{x}"
  #     end
  # end

  def index_test(val) do
    Enum.map(val, fn {val, arr} ->
      index_test(val, arr, [])
    end)
  end
  def index_test(val, [], new_arr), do: {val, new_arr}
  def index_test(val, [h | t], new_arr) do
    index_test(val, t, new_arr ++ [h*2])
  end
end

# IO.inspect Test.check([["5", "5"], ["6", "6"]])
# input =["110101011001110", "110111111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110"]

# IO.inspect Test.Sandbox.addToTuple({7,5})
IO.inspect Test.Sandbox.index_test([{1, [1,2,3,4,5,6,7,8,9]},{2, [3,2,3,4,5,6,7,8,9]}])
# IO.inspect Test.Sandbox.hello
