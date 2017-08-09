defmodule Delivery.PostalCode.DataParserTest do
  use ExUnit.Case
  alias Delivery.PostalCode.DataParser # So we can call it just as "DataParser"
  doctest Delivery

  test "parse_data" do
    # Visual test
    # data_rows = DataParser.parse_data
    # first_row = Enum.at(data_rows, 0)
    # IO.inspect(first_row)

    geolocation_data = DataParser.parse_data
    {latitude, longitude} = Enum.filter(geolocation_data, fn(row) ->
      Map.get(row, "90210")
    end)

    assert is_float(latitude)
    assert is_float(longitude)

    IO.puts("Latitude: #{latitude} | Longitude: #{longitude}")
  end
end
