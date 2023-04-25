defmodule Todo.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :completed, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :completed])
    |> validate_required([:name, :completed])
  end
end
