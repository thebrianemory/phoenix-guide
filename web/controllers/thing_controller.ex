defmodule HelloPhoenix.ThingController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Thing

  def index(conn, _params) do
    things = Repo.all(Thing)
    render(conn, "index.json", things: things)
  end

  def create(conn, %{"thing" => thing_params}) do
    changeset = Thing.changeset(%Thing{}, thing_params)

    case Repo.insert(changeset) do
      {:ok, thing} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", thing_path(conn, :show, thing))
        |> render("show.json", thing: thing)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HelloPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    thing = Repo.get!(Thing, id)
    render(conn, "show.json", thing: thing)
  end

  def update(conn, %{"id" => id, "thing" => thing_params}) do
    thing = Repo.get!(Thing, id)
    changeset = Thing.changeset(thing, thing_params)

    case Repo.update(changeset) do
      {:ok, thing} ->
        render(conn, "show.json", thing: thing)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HelloPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    thing = Repo.get!(Thing, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(thing)

    send_resp(conn, :no_content, "")
  end
end
