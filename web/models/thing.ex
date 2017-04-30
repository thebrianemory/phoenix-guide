defmodule HelloPhoenix.Thing do
  use HelloPhoenix.Web, :model

  schema "things" do
    field :some_attr, :string
    field :another_attr, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:some_attr, :another_attr])
    |> validate_required([:some_attr, :another_attr])
  end
end
