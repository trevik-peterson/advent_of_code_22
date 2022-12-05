defmodule Day03b do
  def p2() do
    {:ok, contents} = File.read("lib/puzzle_input/day03input.txt")

    contents
    |> String.split("\n", trim: true)
    # |> IO.inspect()
    |> find_match()
    |> Enum.sum()
    |> IO.inspect()

    # |> Enum.map(&find_match(&1))

    # |> Enum.map(&value(&1))
    # |> Enum.sum()
    # |> IO.inspect()
  end

  defp value(letter) do
    # IO.inspect(letter)
    <<v::utf8>> = letter

    if v > 96 do
      v - 96
    else
      v - 38
    end
  end

  defp intersection(chunk) do
    [a, b, c] = chunk
    aa = String.codepoints(a) |> MapSet.new()
    bb = String.codepoints(b) |> MapSet.new()
    cc = String.codepoints(c) |> MapSet.new()

    x =
      MapSet.intersection(aa, bb)
      |> MapSet.to_list()
      |> MapSet.new()

    MapSet.intersection(x, cc)
    |> MapSet.to_list()
    |> List.first()
  end

  defp find_match(string) do
    string
    |> Enum.chunk_every(3)
    |> Enum.map(&intersection(&1))
    |> Enum.map(&value(&1))
  end
end
