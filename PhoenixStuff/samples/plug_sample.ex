defmodule HelloWeb.MessageController do
  use HelloWeb, :controller

  def show(conn, params) do
    case authentitcate(conn) do
      {:ok, user} ->
        case find_message(params["id"]) do
          nil ->
            conn
            |> put_flash(:info, "That message was not found")
            |> redirect(to: "/")

          message ->
            case authorize_message(conn, params["id"]) do
              :ok ->
                render conn, :show, page: find_message(params["id"])
              :error ->
                conn
                |> put_flash(:info, "You cannot acces that page")
                |> redirect(to: "/")
            end
        end
      :error ->
        conn
        |> put_flash(:info, "You must be logged in")
        |> redirect(to: "/")

    end

  end

end
