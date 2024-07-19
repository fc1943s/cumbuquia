defmodule Cumbuquia do
  @moduledoc """
  Ferramenta de linha de comando para numerar reis e rainhas de Cumbúquia.
  Lê nomes e adiciona numeração romana conforme repetição.
  """

  defp number([], _), do: []

  defp number([name | tail], map) do
    name_downcase = name |> String.downcase()
    n = map |> Map.get(name_downcase, 0) |> Kernel.+(1)
    ["#{name} #{n |> RomanNumerals.numeral()}" | tail |> number(map |> Map.put(name_downcase, n))]
  end

  defp read_names, do: IO.stream() |> Stream.map(&String.trim/1) |> Enum.take_while(&(&1 != ""))

  @spec main([String.t()]) :: :ok
  def main(_args) do
    IO.puts("""
    Insira os nomes dos reis e rainhas de Cumbúquia, um por linha.
    Para finalizar, pressione Enter em uma linha em branco.
    """)

    read_names() |> number(%{}) |> Enum.each(&IO.puts/1)
  end
end
