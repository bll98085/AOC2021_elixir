defmodule Aoc.Day3Part2 do
  def main(val) do
    parse_list =
      # input_txt()
      val
      |> String.split("\r\n", trim: true)
      # |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, "", trim: true))
      |> List.delete_at(-1)

    {oxygen, co2} =
      parse_list
        |> transpose
        |> parse
        |> join

    {decimal(parse_list, oxygen), decimal(parse_list, co2)}    # 1 作為 index 讓每次 filter 都能抓到
    # decimal(parse_list, oxygen) * decimal(parse_list, co2)    # 1 作為 index 讓每次 filter 都能抓到
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

  def parse(split_val) do
    split_val
    |> Enum.map(&parse_val(&1))
  end
  def parse_val(val) do
    total = Enum.count(val)
    gamma = Enum.count(val, fn x -> x == "1" end)
    if gamma > total/2 do "1"
    else "0"
    end
  end

  def reverse(val) do
    if val == "0", do: "1", else: "0"
  end

  def join(gamma) do
    epsilon = gamma |> Enum.map(&reverse(&1))
    {gamma, epsilon}
  end

  # def decimal(sort_list, generator_rating) do
  # #   {val, _} =
  # #     parse_val
  # #     |> Enum.join
  # #     |> Integer.parse(2)
  # #   val
  # end

  def decimal(sort_list, generator_rating) do
    decimal(sort_list,generator_rating, 0)
  end

  def decimal(sort_list, [], _), do: sort_list
  def decimal(sort_list, [h | t], index) do
    filter_list = Enum.filter(sort_list, fn row -> Enum.at(row, index) == h end)
    # IO.inspect {sort_list, index}
    if (length(filter_list)) == 1 do
      # {val, _} =
        filter_list
      #   |> Enum.join
      #   |> Integer.parse(2)
      # val
      else
      decimal(filter_list, t, index + 1)
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

input = "00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010"

# IO.inspect Aoc.Day3.main(report) #part 1
IO.inspect Aoc.Day3Part2.main(input)
