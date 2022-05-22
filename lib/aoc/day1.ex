defmodule Servy do
  def main do
    input_txt()
    |> String.split("\n")
    |> Enum.map(&(String.trim(&1, " ")))
    # |> String.replace("\r", "")
    # |> Enum.map(&(String.to_integer(&1)))  # 算次數，不用轉 integer
    |> meansure
  end

  def input_txt do
    Path.expand("../source", __DIR__)
    |> Path.join("input1.txt")
    |> File.read
    |> handle_file
  end

  def handle_file({:ok, content}) do
    content
  end

  def handle_file({:error, reason}) do
    reason
  end

  def meansure([h | t]) do
    meansure(t, h, 0)
  end

  def meansure([h | t], prev, acc) do
    case h > prev do
      :true -> meansure(t, h, acc+ 1)
      :false -> meansure(t, h, acc)
    end
  end

  def meansure([], _, acc), do: acc
end

IO.inspect Servy.main
