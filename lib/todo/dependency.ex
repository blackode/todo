defmodule Todo.Dependency do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dependencies" do

    field :task_id, :id
    field :dependency_id, :id

    timestamps()
  end

  @doc false
  def changeset(dependency, attrs) do
    dependency
    |> cast(attrs, [])
    |> validate_required([])
  end
end
