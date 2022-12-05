defmodule Day03 do
  def p1() do
    {:ok, contents} = File.read("lib/puzzle_input/day03input.txt")

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&find_match(&1))
    |> Enum.map(&value(&1))
    |> Enum.sum()
    |> IO.inspect()
  end

  defp value(letter) do
    <<v::utf8>> = letter

    if v > 96 do
      v - 96
    else
      v - 38
    end
  end

  defp find_match(string) do
    half = trunc(String.length(string) / 2)

    [a, b] =
      string
      |> String.codepoints()
      |> Enum.chunk_every(half, half, [])

    aa = MapSet.new(a)
    bb = MapSet.new(b)

    MapSet.intersection(aa, bb)
    |> MapSet.to_list()
    |> List.first()
  end
end
