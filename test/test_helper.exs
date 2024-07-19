ExUnit.start()

defmodule TestHelper do
  @moduledoc """
  Módulo de ajuda para testes de aplicações CLI em Elixir.

  Este módulo fornece funções utilitárias para executar scripts CLI com entrada
  simulada e verificar suas saídas esperadas. Ele é especialmente útil para
  testes de ponta a ponta (E2E) de ferramentas de linha de comando.
  """

  use ExUnit.Case

  defp spawn_with_input(command, input) do
    port = Port.open({:spawn, command}, [:binary])
    port |> send({self(), {:command, input}})
    port |> receive_output("")
  end

  defp receive_output(port, acc) do
    receive do
      {^port, {:data, data}} -> port |> receive_output(acc <> data)
      {^port, {:exit_status, 0}} -> acc
    after
      1000 -> acc
    end
  end

  def test_cli(input, command, expected),
    do: assert(command |> spawn_with_input(input) == expected)
end
