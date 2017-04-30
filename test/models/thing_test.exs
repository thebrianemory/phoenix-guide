defmodule HelloPhoenix.ThingTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Thing

  @valid_attrs %{another_attr: "some content", some_attr: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Thing.changeset(%Thing{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Thing.changeset(%Thing{}, @invalid_attrs)
    refute changeset.valid?
  end
end
