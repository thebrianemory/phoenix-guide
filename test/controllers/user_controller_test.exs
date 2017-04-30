defmodule HelloPhoenix.UserControllerTest do
  use HelloPhoenix.ConnCase, async: true

  alias HelloPhoenix.{Repo, User}

  # Tests created for JSON response testing
  test "index/2 responds with all Users" do
    users = [ User.changeset(%User{}, %{name: "John", email: "john@example.com"}),
              User.changeset(%User{}, %{name: "Jane", email: "jane@example.com"}) ]

    Enum.each(users, &Repo.insert!(&1))

    response = build_conn
    |> get(user_path(build_conn, :index))
    |> json_response(200)

    expected = %{
      "data" => [
        %{ "name" => "John", "email" => "john@example.com" },
        %{ "name" => "Jane", "email" => "jane@example.com" }
      ]
    }

    assert response == expected
  end

  describe "create/2" do
    test "Creates, and responds with a newly created user if attributes are valid"
    test "Returns an error and does not create a user if attributes are invalid"
  end

  describe "show/2" do
    test "Responds with a newly created user if the user is found" do
      user = User.changeset(%User{}, %{name: "John", email: "john@example.com"})
      |> Repo.insert!

      response = build_conn
      |> get(user_path(build_conn, :show, user.id))
      |> json_response(200)

      expected = %{ "data" => %{ "name" => "John", "email" => "john@example.com" } }

      assert response == expected
    end

    test "Returns with a message indicating user not found" do
      response = build_conn
      |> get(user_path(build_conn, :show, 300))
      |> json_response(404)

      expected = %{ "error" => "User not found."}

      assert response == expected
    end
  end

  describe "update/2" do
    test "Edits, and responds with the user if attributes are valid"
    test "Returns an error and does not edit the user if attributes are invalid"
  end

  test "delete/2 and responds with :ok if the user was deleted"

  # Tests generated upon running phoenix.gen.html
  # alias HelloPhoenix.User
  # @valid_attrs %{bio: "I am Batman", email: "batman@example.com", name: "Batman", number_of_pets: 12}
  # @invalid_attrs %{}

  # test "lists all entries on index", %{conn: conn} do
  #   conn = get conn, user_path(conn, :index)
  #   assert html_response(conn, 200) =~ "Listing users"
  # end

  # test "renders form for new resources", %{conn: conn} do
  #   conn = get conn, user_path(conn, :new)
  #   assert html_response(conn, 200) =~ "New user"
  # end

  # test "creates resource and redirects when data is valid", %{conn: conn} do
  #   conn = post conn, user_path(conn, :create), user: @valid_attrs
  #   assert redirected_to(conn) == user_path(conn, :index)
  #   assert Repo.get_by(User, @valid_attrs)
  # end

  # test "does not create resource and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, user_path(conn, :create), user: @invalid_attrs
  #   assert html_response(conn, 200) =~ "New user"
  # end

  # test "shows chosen resource", %{conn: conn} do
  #   user = Repo.insert! %User{}
  #   conn = get conn, user_path(conn, :show, user)
  #   assert html_response(conn, 200) =~ "Show user"
  # end

  # test "renders page not found when id is nonexistent", %{conn: conn} do
  #   assert_error_sent 404, fn ->
  #     get conn, user_path(conn, :show, -1)
  #   end
  # end

  # test "renders form for editing chosen resource", %{conn: conn} do
  #   user = Repo.insert! %User{}
  #   conn = get conn, user_path(conn, :edit, user)
  #   assert html_response(conn, 200) =~ "Edit user"
  # end

  # test "updates chosen resource and redirects when data is valid", %{conn: conn} do
  #   user = Repo.insert! %User{}
  #   conn = put conn, user_path(conn, :update, user), user: @valid_attrs
  #   assert redirected_to(conn) == user_path(conn, :show, user)
  #   assert Repo.get_by(User, @valid_attrs)
  # end

  # test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #   user = Repo.insert! %User{}
  #   conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
  #   assert html_response(conn, 200) =~ "Edit user"
  # end

  # test "deletes chosen resource", %{conn: conn} do
  #   user = Repo.insert! %User{}
  #   conn = delete conn, user_path(conn, :delete, user)
  #   assert redirected_to(conn) == user_path(conn, :index)
  #   refute Repo.get(User, user.id)
  # end
end
