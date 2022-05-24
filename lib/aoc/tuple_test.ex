defmodule Aoc.Tuple_test do
  def main(input) do
    input
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer(&1))

  end

  def func do
    foo = fn element, acc ->
      if rem(element, 2) == 0 do
        {:cont, Enum.reverse([element | acc]), []}
      else
        {:cont, [element | acc]}
      end
    end
    foo
  end

  def flat(rep) do
    Enum.flat_map(rep, fn t ->
      list = Tuple.to_list(t)
      list
      |> Enum.chunk_every(div(length(list), 2))
      |> Enum.map(&List.to_tuple/1)
    end)
    with {bottom, top} <-
      Enum.reduce(rep, {[], []}, fn t, {top, bottom} ->
        l = Tuple.to_list(t)
        [t, b] =
          l
          |> Enum.chunk_every(div(length(l), 2))
          |> Enum.map(&List.to_tuple/1)
        {[t|top], [b|bottom]}
      end) do
   [top, bottom]
   |> Enum.map(&Enum.reverse/1)
   |> Enum.reduce(&Kernel.++/2)
 end

  end
end

# input=
# "12345"

report=
[
  {"-", "-", "-", "7", "-", "-", "-", "-", "-", "-", "0", "-"},
  {"-", "-", "5", "-", "-", "-", "-", "-", "-", "-", "-", "-"},
  {"-", "5", "-", "-", "-", "-", "-", "-", "-", "7", "-", "-"},
  {"5", "-", "-", "-", "-", "-", "-", "-", "5", "-", "-", "-"}
]

# IO.inspect Aoc.Tuple_test.func.foo([1,2])
IO.inspect Aoc.Tuple_test.flat(report)
