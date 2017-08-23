defmodule HelloWeb.MessageController do
  use HelloWeb, :controller

  plug :authentitcate
  plug :find_message
  plug :authorize_message

  def show(conn, params) do
    rener conn, :show, page: find_message(params["id"])
  end

  defp authentitcate(conn) do
    ...
  end

  defp authentitcate(conn, _) do
    case Authenticator.find_user(conn) do
      {:ok, user} ->
        assign(conn, :user, user)
      error ->
        conn
        |> put_flash(:info, "You must be logged in")
        |> redirect(to: "/")
        |> halt()
    end
  end

  defp find_message(id) do
    ...
  end
  defp find_message(conn, _) do
    case find_message(conn.parms["id"]) do
      nil ->
        conn
        |> put_flash(:info, "That message was not found")
        |> redirect(to: "/")
        |> halt()
      message ->
        assign(conn, :message, message)
    end
  end

  def authorize_message(conn, _) do
    if Authorizer.can_acces?(conn.assigns[:user], conn.assigns[:message]) do
      conn
    else
      conn
      |> put_flash(:info, "You cannot acces this page")
      |> redirect(to: "/")
      |> halt()
    end
  end

end
