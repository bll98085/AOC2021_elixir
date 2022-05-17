<<<<<<< HEAD
defmodule Test.Hello do
  # def check(val) do
  #   val
  #   # |> Enum.map(&(integer(&1)))
  # end
=======
defmodule Test.Sandbox do
  def check(val) do
    val
    # |> Enum.map(&(integer(&1)))
  end
>>>>>>> f77bc3e35a8d085620066bd50a61f7ba4ab4b4ba

  # def integer([h | t]) do
  #   # IO.inspect t
  #   t |> String.to_integer
  #   [h | t]
  # end

<<<<<<< HEAD
  def hello(rep) do
    rep
    |> Enum.map(&String.graphemes(&1))
    |> transpose
  end

  def transpose(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
=======
  # def test_transpose do
  #   a = [["1", "2"], ["3", "4"], ["5", "6"]]
  #   b = transpose(a)
  # end

  def transpose(rows) do
    rows
    |> Enum.flat_map(fn val ->
      val ++ (val |> List.zip |> Enum.map(&Tuple.to_list/1))
    end)
    # rows ++ (rows |> List.zip |> Enum.map(&Tuple.to_list/1))


    # |> Enum.map(&Tuple.to_list/1)
>>>>>>> f77bc3e35a8d085620066bd50a61f7ba4ab4b4ba
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


<<<<<<< HEAD
# IO.inspect Test.Hello.test_transpose(input)
IO.inspect Test.Hello.hello(input)
=======
# report =
#   [
#     [
#       [22, 13, 17, 11, 0],
#       [8, 2, 23, 4, 24],
#       [21, 9, 14, 16, 7],
#       [6, 10, 3, 18, 5],
#       [1, 12, 20, 15, 19]
#     ],
#     [
#       [3, 15, 0, 2, 22],
#       [9, 18, 13, 17, 5],
#       [19, 8, 7, 25, 23],
#       [20, 11, 10, 24, 4],
#       [14, 21, 16, 12, 6]
#     ],
#     [
#       [14, 21, 17, 24, 4],
#       [10, 16, 15, 9, 19],
#       [18, 8, 23, 26, 20],
#       [22, 11, 13, 6, 5],
#       [2, 0, 12, 3, 7]
#     ]
#   ]



# IO.inspect Test.Sandbox.transpose(report)

input =
  [1,8,7,4,5]

IO.inspect Test.Sandbox.reduce_value(input)
>>>>>>> f77bc3e35a8d085620066bd50a61f7ba4ab4b4ba
