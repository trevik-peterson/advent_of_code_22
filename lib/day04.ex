defmodule Day04 do
  def p1() do
    {:ok, contents} = File.read("lib/puzzle_input/day04input.txt")

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn data -> String.split(data, ",") end)
    |> Enum.map(&wrapped?(&1))
    |> Enum.sum()
    |> IO.inspect()
  end

  def wrapped?(data) do
    [a, b] = data
    [a_min, a_max] = String.split(a, "-")
    [b_min, b_max] = String.split(b, "-")
    {a_min, ""} = Integer.parse(a_min)
    {b_min, ""} = Integer.parse(b_min)
    {a_max, ""} = Integer.parse(a_max)
    {b_max, ""} = Integer.parse(b_max)

    #                    A in B                            B in A
    if (a_min >= b_min and a_max <= b_max) || (b_min >= a_min and b_max <= a_max) do
      1
    else
      0
    end
  end

  def p2() do
    {:ok, contents} = File.read("lib/puzzle_input/day04input.txt")

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn data -> String.split(data, ",") end)
    |> Enum.map(&overlapped?(&1))
    |> Enum.sum()
    |> IO.inspect()
  end

  def overlapped?(data) do
    [a, b] = data
    [a_min, a_max] = String.split(a, "-")
    [b_min, b_max] = String.split(b, "-")
    {a_min, ""} = Integer.parse(a_min)
    {b_min, ""} = Integer.parse(b_min)
    {a_max, ""} = Integer.parse(a_max)
    {b_max, ""} = Integer.parse(b_max)

    if (a_max >= b_min and a_min <= b_max) || (a_min <= b_max and a_max >= b_min) do
      1
    else
      0
    end
  end
end
