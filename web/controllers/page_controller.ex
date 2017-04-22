defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render(HelloPhoenix.ErrorView, "404.html")

    # render conn, "index.text", message: params["message"]

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
