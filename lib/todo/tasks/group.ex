defmodule Todo.Tasks.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :completed, :boolean, default: false
    field :name, :string

    has_many :tasks, Todo.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :completed])
    |> cast_assoc(:tasks, with: &Todo.Tasks.Task.changeset/2)
    |> validate_required([:name, :completed])
  end
end
