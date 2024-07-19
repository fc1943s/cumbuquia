defmodule CumbuquiaTest do
  @moduledoc """
  Testes de ponta a ponta (E2E) para a ferramenta de linha de comando de Cumbúquia.
  """

  use ExUnit.Case
  doctest Cumbuquia

  setup_all do
    System.cmd("mix", ["escript.build"], env: [{"MIX_ENV", "prod"}])
    :ok
  end

  @command "./cumbuquia"

  test "nomes são numerados corretamente" do
    """
    Eduardo
    Maria
    Daniel
    Eduardo

    """
    |> TestHelper.test_cli(@command, """
    Insira os nomes dos reis e rainhas de Cumbúquia, um por linha.
    Para finalizar, pressione Enter em uma linha em branco.

    Eduardo I
    Maria I
    Daniel I
    Eduardo II
    """)
  end

  test "nomes repetidos são incrementados corretamente" do
    """
    João
    João
    João
    João

    """
    |> TestHelper.test_cli(@command, """
    Insira os nomes dos reis e rainhas de Cumbúquia, um por linha.
    Para finalizar, pressione Enter em uma linha em branco.

    João I
    João II
    João III
    João IV
    """)
  end

  test "casos complexos são tratados corretamente" do
    """
    Ana
    Beatriz
    Ana
    ana
    Carlos
    Ana Maria
    Ana Maria
    Beatriz
    Beatriz
    Carlos
    carlos
    João
    João
    João
    joão
    Maria
    maria
    Beatriz-Maria
    Beatriz-maria
    ana
    Ana
    João
    João
    joão

    """
    |> TestHelper.test_cli(@command, """
    Insira os nomes dos reis e rainhas de Cumbúquia, um por linha.
    Para finalizar, pressione Enter em uma linha em branco.

    Ana I
    Beatriz I
    Ana II
    ana III
    Carlos I
    Ana Maria I
    Ana Maria II
    Beatriz II
    Beatriz III
    Carlos II
    carlos III
    João I
    João II
    João III
    joão IV
    Maria I
    maria II
    Beatriz-Maria I
    Beatriz-maria II
    ana IV
    Ana V
    João V
    João VI
    joão VII
    """)
  end
end
