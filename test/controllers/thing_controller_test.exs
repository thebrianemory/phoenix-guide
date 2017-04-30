defmodule HelloPhoenix.ThingControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.Thing
  @valid_attrs %{another_attr: "some content", some_attr: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, thing_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    thing = Repo.insert! %Thing{}
    conn = get conn, thing_path(conn, :show, thing)
    assert json_response(conn, 200)["data"] == %{"id" => thing.id,
      "some_attr" => thing.some_attr,
      "another_attr" => thing.another_attr}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, thing_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, thing_path(conn, :create), thing: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Thing, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, thing_path(conn, :create), thing: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    thing = Repo.insert! %Thing{}
    conn = put conn, thing_path(conn, :update, thing), thing: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Thing, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    thing = Repo.insert! %Thing{}
    conn = put conn, thing_path(conn, :update, thing), thing: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    thing = Repo.insert! %Thing{}
    conn = delete conn, thing_path(conn, :delete, thing)
    assert response(conn, 204)
    refute Repo.get(Thing, thing.id)
  end
end
