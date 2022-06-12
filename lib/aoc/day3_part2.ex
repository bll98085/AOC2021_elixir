defmodule Aoc.Day3Part2 do
  def main do
    parse_list =
      input_txt()
      |> String.split("\n", trim: true)
      # |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, "", trim: true))
      # |> List.delete_at(-1)

    elem(Integer.parse(parse(parse_list), 2), 0) * elem(Integer.parse(co2_parse(parse_list), 2), 0)
  end

  def input_txt do
    Path.expand("../source", __DIR__)
    |> Path.join("input3.txt")
    |> File.read
    |> handle_file
  end

  def handle_file({:ok, content}) do
    content
  end
  def handle_file({:error, reason}) do
    reason
  end

  def transpose(row) do
    row
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  def parse(list) do
    parse(list, 0)
  end
  def parse(split_val, index) do
    if length(split_val) != 1 do
      each_parse = transpose(split_val)
      filter_num = parse_val(Enum.at(each_parse, index))
      sort_list = Enum.filter(split_val, fn val -> Enum.at(val, index) == filter_num end)
      parse(sort_list, index + 1)
    else
      Enum.join(split_val)
    end
  end
  def parse_val(val) do
    total = length(val) / 2
    gamma = Enum.count(val, fn x -> x == "1" end)

    if gamma >= total do "1"
    else "0"
    end
  end

  def co2_parse(list) do
    co2_parse(list, 0)
  end
  def co2_parse(split_val, index) do
    if length(split_val) != 1 do
      each_parse = transpose(split_val)
      filter_num = co2_parse_val(Enum.at(each_parse, index))
      sort_list = Enum.filter(split_val, fn val -> Enum.at(val, index) == filter_num end)
      co2_parse(sort_list, index + 1)
    else
      Enum.join(split_val)
    end
  end
  def co2_parse_val(val) do
    total = length(val) / 2
    gamma = Enum.count(val, fn x -> x == "0" end)

    if gamma > total do "1"
    else "0"
    end
  end


  #   gam_split =
  #     String.split(gam, "")
  #     |> diagnostic(origin)
  #   eps_split = String.split(eps, "")


  #   # x= elem(Integer.parse(gam, 2), 0)
  #   # y= elem(Integer.parse(eps, 2), 0)
  #   # String.to_integer
  #   # x * y
  # end

  # def diagnostic(origin, target) do
  #   index = 1
  #   Enum.map(target, fn val ->
  #     filter(val, origin)
  #     index + 1
  #   end)
  # end

  # def filter_row(row, origin) do
  #   Enum.filter(origin, fn row -> Enum.at(row, index) == val end)
  #   Enum.filter
  # end
  # def diagno(target, [h | t], index) do
  #   if Enum.at(h, index) == target do
  #     diagno(target, t, index + 1)
  #   else []
  #   end
  # end
end

# input = "00100
# 11110
# 10110
# 10111
# 10101
# 01111
# 00111
# 11100
# 10000
# 11001
# 00010
# 01010"

# IO.inspect Aoc.Day3.main(report) #part 1
IO.inspect Aoc.Day3Part2.main
