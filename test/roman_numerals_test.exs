defmodule RomanNumeralsTest do
  @moduledoc """
  Testes para verificar a conversão de números inteiros em numerais romanos utilizando
  o módulo `RomanNumerals`.
  """

  use ExUnit.Case

  test "1", do: assert(RomanNumerals.numeral(1) == "I")
  test "2", do: assert(RomanNumerals.numeral(2) == "II")
  test "3", do: assert(RomanNumerals.numeral(3) == "III")
  test "4", do: assert(RomanNumerals.numeral(4) == "IV")
  test "5", do: assert(RomanNumerals.numeral(5) == "V")
  test "6", do: assert(RomanNumerals.numeral(6) == "VI")
  test "9", do: assert(RomanNumerals.numeral(9) == "IX")
  test "16", do: assert(RomanNumerals.numeral(16) == "XVI")
  test "27", do: assert(RomanNumerals.numeral(27) == "XXVII")
  test "48", do: assert(RomanNumerals.numeral(48) == "XLVIII")
  test "59", do: assert(RomanNumerals.numeral(59) == "LIX")
  test "66", do: assert(RomanNumerals.numeral(66) == "LXVI")
  test "93", do: assert(RomanNumerals.numeral(93) == "XCIII")
  test "141", do: assert(RomanNumerals.numeral(141) == "CXLI")
  test "163", do: assert(RomanNumerals.numeral(163) == "CLXIII")
  test "402", do: assert(RomanNumerals.numeral(402) == "CDII")
  test "575", do: assert(RomanNumerals.numeral(575) == "DLXXV")
  test "666", do: assert(RomanNumerals.numeral(666) == "DCLXVI")
  test "911", do: assert(RomanNumerals.numeral(911) == "CMXI")
  test "1024", do: assert(RomanNumerals.numeral(1024) == "MXXIV")
  test "1666", do: assert(RomanNumerals.numeral(1666) == "MDCLXVI")
  test "3000", do: assert(RomanNumerals.numeral(3000) == "MMM")
  test "3001", do: assert(RomanNumerals.numeral(3001) == "MMMI")
  test "3888", do: assert(RomanNumerals.numeral(3888) == "MMMDCCCLXXXVIII")
  test "3999", do: assert(RomanNumerals.numeral(3999) == "MMMCMXCIX")
  test "4444", do: assert(RomanNumerals.numeral(4444) == "MMMMCDXLIV")
end
