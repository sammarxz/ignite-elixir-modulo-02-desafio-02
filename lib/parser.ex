defmodule GenReport.Parser do
  @moduledoc """
  Read a CSV report, convert string values to integer and put months names

  ## Returns Example
      [
        "daniele", 8, 29, "abril", 2018",
        "marcos", 4, 5, "maio", 2016,
        "samuel", 5, 5, "maio", 2019"
        ...
      ]

  ## Ussage
      iex> GenReport.Parser.parse_file("gen_report.csv")
  """

  alias GenReport.MonthHelper

  def parse_file(file_name) do
    file_name
    |> File.stream!()
    |> Stream.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> format_line()
    |> List.update_at(3, &MonthHelper.get_month_name/1)
  end

  defp format_line([name | values]), do: [String.downcase(name) | Enum.map(values, &String.to_integer/1)]
end
