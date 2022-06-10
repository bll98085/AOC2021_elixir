defmodule Aoc.Day2 do
  def figure do
    {forward, _depth_val, aim} =
      input_txt()
      |> String.split("\n", trim: true)
      # |> Enum.map(&(String.trim(&1, "\r")))
      |> Enum.map(&(String.split(&1, " ")))
      |> Enum.map(&(tostring(&1)))
      |> Enum.reduce({0, 0, 0}, fn distance, depth -> transf_report(distance, depth) end)
    forward * aim
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

  def transf_report([h,t], {fin_distance, fin_dep, aim}) do
    transf_report(h, t, {fin_distance, fin_dep, aim})
  end

  def transf_report("forward", t, {fin_distance, fin_dep, aim}) do
    {
      fin_distance + t,
      fin_dep,
      check_multiple(t, fin_dep, aim)
    }
  end

  def transf_report("down", t, {fin_distance, fin_dep, aim}) do
    {fin_distance, fin_dep + t, aim}
  end

  def transf_report("up", t, {fin_distance, fin_dep, aim}) do
    {fin_distance, fin_dep- t, aim}
  end

  def check_multiple(now_val, depth, aim) do
    if(depth != 0) do
      (now_val * depth) + aim
    else
      aim
    end
  end
end


# foo =
# "forward 5
# down 5
# forward 8
# up 3
# down 8
# forward 2"

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
#       Enum.reduce( rep, {0, 0}, fn[direction, size], {aimizontal, depth} ->
#         size = String.to_integer(size)

#         case direction do
#           "forward" -> {aimizontal + size, depth}
#           "down" -> {aimizontal, depth + size}
#           "up" -> {aimizontal, depth - size}
#         end
#       end)
#     x * y
#   end
# end

IO.inspect Aoc.Day2.figure
