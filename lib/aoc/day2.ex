defmodule Aoc.Day2 do
  def figure(rep) do
    rep
    |> String.split("\n")
    |> Enum.map(&(String.trim(&1, "\r")))
    |> Enum.map(&(String.split(&1, " ")))
    |> Enum.map(&(tostring(&1)))
    |> Enum.map(&(sort_report(&1)))
    # |> Enum.map(&sort(&1))
  end

  def tostring([h, t]) do
    [ h, String.to_integer(t) ]
  end

  def sort_report([h,t]) do
    sort_report(h, t, {0, 0})
  end

  def sort_report("forward", t, {hor, dep}) do
    {hor+ t, dep}
  end

  def sort_report("down", t, {hor, dep}) do
    {hor, dep + t}
  end

  def sort_report("up", t, {hor, dep}) do
    {hor, dep- t}
  end

  def sort(val) do
    {h, d} =
      Enum.reduce(val, {0, 0}, fn{horizontal, depth}, {direction, size} ->
        case horizontal > depth do
          :true -> direction+ horizontal
          :false -> size+ depth
          # :true -> direction + horizontal
          # :false -> path + depth
        end
    end)
    h * d
  end
end




# defmodule Aoc.Day2 do
#   def main(rep) do
#     rep
#     |> String.split("\n" ,trim: true)
#     |> Enum.map(&(String.trim(&1, "\r")))
#     |> Enum.map(&(String.split(&1, " ")))
#     |> parse
#   end

#   def parse(rep) do
#     {x, y} =
#       Enum.reduce( rep, {0, 0}, fn[direction, size], {horizontal, depth} ->
#         size = String.to_integer(size)

#         case direction do
#           "forward" -> {horizontal + size, depth}
#           "down" -> {horizontal, depth + size}
#           "up" -> {horizontal, depth - size}
#         end
#       end)
#     x * y
#   end

# end




report =
"forward 5
down 5
forward 8
up 3
down 8
forward 2"

IO.inspect Aoc.Day2.figure(report)
# IO.inspect Aoc.Day2.main(report)
