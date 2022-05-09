defmodule Test do
  def check(val) do
    val
    # |> Enum.map(&(integer(&1)))
  end

  def integer([h | t]) do
    # IO.inspect t
    t |> String.to_integer
    [h | t]
  end

  def test_transpose do
    a = [["1", "2"], ["3", "4"], ["5", "6"]]
    b = transpose(a)
  end

  def transpose(rows) do
    rows
    |> List.zip
    # |> Enum.map(&Tuple.to_list/1)
  end
end

# IO.inspect Test.check([["5", "5"], ["6", "6"]])

IO.inspect Test.test_transpose
