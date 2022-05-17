defmodule Aoc.Day2 do
  def figure do
    input_txt()
    |> String.split("\n", trim: true)
    # |> Enum.map(&(String.trim(&1, "\r")))
    |> Enum.map(&(String.split(&1, " ")))
    |> Enum.map(&(tostring(&1)))
    |> Enum.map(&(transf_report(&1)))
    |> sort
  end

  def input_txt do
    Path.expand("../source", __DIR__)
    |> Path.join("input2.txt")
    |> File.read
    |> handle_file
  end

  def handle_file({:ok, val}) do
    val
  end

  def handle_file({:error, reason}) do
    reason
  end

  def tostring([h, t]) do
    [ h, String.to_integer(t) ]
  end

  def transf_report([h,t]) do
    transf_report(h, t, {0, 0})
  end

  def transf_report("forward", t, {hor, dep}) do
    {hor+ t, dep}
  end

  def transf_report("down", t, {hor, dep}) do
    {hor, dep + t}
  end

  def transf_report("up", t, {hor, dep}) do
    {hor, dep- t}
  end

  def sort(val) do
    {h, d} =
      Enum.reduce(val, {0, 0}, fn({horizontal, depth}, {dir, hei}) ->
        case horizontal != 0 do
          :true -> {dir+ horizontal, hei}
          :false -> {dir, hei+ depth}
        end
      end)
    h * d
  end
end


# ---- solution 2 ------

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

IO.inspect Aoc.Day2.figure
