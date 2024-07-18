defmodule RomanNumerals do
  @moduledoc """
  Módulo para converter números inteiros positivos para seus equivalentes em algarismos romanos.
  """

  @numerals [
    M: 1000,
    D: 500,
    C: 100,
    L: 50,
    X: 10,
    V: 5,
    I: 1
  ]

  defp numerals({roman, value}, {roman!, value!}, tail),
    do: numerals([{roman, value}]) ++ [{"#{roman!}#{roman}", value - value!} | tail |> numerals]

  defp numerals([{roman, value}]), do: [{"#{roman}", value}]

  defp numerals([{_, value} = a | [_ | [b | _]] = tail]) when value |> Bitwise.band(16) == 0,
    do: numerals(a, b, tail)

  defp numerals([a | [b | _] = tail]), do: numerals(a, b, tail)

  defp numerals, do: @numerals |> numerals

  defp numeral(0, acc, _), do: acc

  defp numeral(n, acc, [{roman, value} | tail]),
    do: n |> rem(value) |> numeral("#{acc}#{roman |> String.duplicate(n |> div(value))}", tail)

  @spec numeral(pos_integer) :: String.t()
  def numeral(n), do: n |> numeral("", numerals())
end
