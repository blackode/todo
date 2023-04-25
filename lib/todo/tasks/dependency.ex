defmodule Todo.Tasks.Dependency do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dependencies" do
    belongs_to :task, Todo.Tasks.Task
    belongs_to :dependency, Todo.Tasks.Task
    
    timestamps()
  end

  @doc false
  def changeset(dependency, attrs) do
    dependency
    |> cast(attrs, [])
    |> validate_required([])
  end
end
