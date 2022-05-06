defmodule Sandbox do
  def test(rep) do
    rep
    |> String.split(" ")

  end
end

report =
  "14 54 45 65 4"

IO.inspect Sandbox.test(report)
