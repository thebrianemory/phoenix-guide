defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

  def index(conn, params) do
    render conn, "index.text", message: params["message"]

    # render conn, :index

    # conn
    # |> put_layout("admin.html")
    # |> render "index.html"

    # |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    # |> put_flash(:error, "Let's pretend we have an error")
    # |> render("index.html")

    # |> put_layout(false)
    # |> render "index.html"
  end
end
