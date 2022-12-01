defmodule Day01 do
  def calorie_count do
    {:ok, contents} = File.read("lib/day01input.txt")

    contents
    |> String.split("\n\n", trim: true)
    |> Enum.map(fn calories -> convert_and_sum(calories) end)
    |> Enum.max()
    |> IO.inspect()
  end

  defp convert_and_sum(calories) do
    String.split(calories, "\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end
end
