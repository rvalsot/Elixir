defmodule TestingSampleWeb.PageController do
  use TestingSampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
