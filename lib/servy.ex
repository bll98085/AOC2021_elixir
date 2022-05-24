defmodule Servy.Test do
  # def main(rep, acc) do
  #   rep
  #   |> String.split("\n")   # ["199", "200", "208", "210", "200", "207", "240", "269", "260", "263"]
  #   |> meansure
  # end

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

# report = "199
# 200
# 208
# 210
# 200
# 207
# 240
# 269
# 260
# 263"
