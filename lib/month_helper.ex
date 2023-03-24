defmodule GenReport.MonthHelper do
  @moduledoc"""
  Given a month number, returns proper month name

  ## Usage
      iex> GenReport.MonthHelper.get_month_name(1)
      "janeiro"

      iex> GenReport.MonthHelper.get_month_name(2)
      "fevereiro"
  """

  @months %{
    1 => "janeiro",
    2 => "fevereiro",
    3 => "março",
    4 => "abril",
    5 => "maio",
    6 => "junho",
    7 => "julho",
    8 => "agosto",
    9 => "setembro",
    10 => "outubro",
    11 => "novembro",
    12 => "dezembro"
  }

  def get_month_name(num) when num  >= 1 and num <= map_size(@months), do: @months[num]
  def get_month_name(_num), do: "Use apenas números inteiros de 1 a 12, por favor :)"
end
