defmodule Day02 do
  def p1 do
    {:ok, contents} = File.read("lib/puzzle_input/day02input.txt")

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn fight -> String.split(fight, " ", trim: true) |> p1_score() end)
    |> Enum.sum()
    |> IO.inspect()
  end

  defp p1_score(["A", "X"]), do: 4
  defp p1_score(["A", "Y"]), do: 8
  defp p1_score(["A", "Z"]), do: 3

  defp p1_score(["B", "X"]), do: 1
  defp p1_score(["B", "Y"]), do: 5
  defp p1_score(["B", "Z"]), do: 9

  defp p1_score(["C", "X"]), do: 7
  defp p1_score(["C", "Y"]), do: 2
  defp p1_score(["C", "Z"]), do: 6

  def p2 do
    {:ok, contents} = File.read("lib/puzzle_input/day02input.txt")

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn fight -> String.split(fight, " ", trim: true) |> p2_score() end)
    |> Enum.sum()
    |> IO.inspect()
  end

  defp p2_score(["A", "X"]), do: 3
  defp p2_score(["A", "Y"]), do: 4
  defp p2_score(["A", "Z"]), do: 8

  defp p2_score(["B", "X"]), do: 1
  defp p2_score(["B", "Y"]), do: 5
  defp p2_score(["B", "Z"]), do: 9

  defp p2_score(["C", "X"]), do: 2
  defp p2_score(["C", "Y"]), do: 6
  defp p2_score(["C", "Z"]), do: 7
end
