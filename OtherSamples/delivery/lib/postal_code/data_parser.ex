defmodule Delivery.PostalCode.DataParser do
  @postal_codes_filepath "data/2016_Gaz_zcta_national.txt"

  def parse_data do
    [ _ | data_rows] = File.read!(@postal_codes_filepath)
    |> String.split("\n")

    data_rows
    |> Enum.map(fn(row) ->
        String.split(row, "\t")
      end)
    |> Enum.filter(fn(row) ->
        case row do
          [_zip_code, _, _, _, _, _latitude, _longitude] -> true
          _ -> false
        end
      end)
    |> Enum.map(fn(row) ->
        [zip_code, _, _, _, _, latitude, longitude] = row

        # Passes:
        [zip_code, latitude, longitude]
      end)
    |> Enum.map(fn(row) ->
        [zip_code, latitude, longitude] = row

        latitude = latitude
          |> String.replace(" ", "")
          |> String.to_float()

        longitude = longitude
          |> String.replace(" ", "")
          |> String.to_float()

        # Passes:
        {zip_code, {latitude, longitude}}
      end )
  end


end
