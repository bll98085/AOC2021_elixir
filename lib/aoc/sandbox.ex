
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

end

# IO.inspect Test.check([["5", "5"], ["6", "6"]])
input =["110101011001110", "110111111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110", "100000111111110"]
