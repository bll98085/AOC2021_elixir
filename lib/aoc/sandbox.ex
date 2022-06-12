defmodule Sandbox do
  def plus(arr) do
    # Enum.reduce(arr, [], fn val, fin_arr ->
    #   val+
    # end)
    arr
    |> Enum.reduce(0, fn val, fin -> fin + val end)
    # Enum.chunk_every(arr, 3, 1)
  end

  def func(val) do

  end
end

foo =
[1,2,3,4,5]

IO.inspect Sandbox.plus(foo)
