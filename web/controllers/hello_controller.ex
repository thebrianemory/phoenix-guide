defmodule HelloPhoenix.HelloController do
  use HelloPhoenix.Web, :controller

  plug :assign_welcome_message, "Welcome back" when action in [:index, :show]

  def index(conn, _params) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")

    # |> assign(:name, "Dweezil")
    # |> render("index.html")
  end

  def show(conn, %{"messenger" => messenger} = params) do
    # render conn, "show.html", messenger: messenger

    # json conn, %{messenger: messenger}

    # html conn, """
    #  <html>
    #    <head>
    #       <title>Passing a Messenger</title>
    #    </head>
    #    <body>
    #      <p>You sent in messenger #{messenger}</p>
    #    </body>
    #  </html>
    # """
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end
