defmodule Todo.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :name, :string
    field :completed, :boolean, default: false
    field :locked, :boolean, default: false

    belongs_to :group, Todo.Tasks.Group
    has_many :dependent_tasks, Todo.Tasks.Dependency, foreign_key: :dependency_id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :completed, :locked, :group_id])
    |> cast_assoc(:dependent_tasks, with: &Todo.Tasks.Dependency.changeset/2)
    |> validate_required([:name, :completed, :locked, :group_id])
    |> foreign_key_constraint(:group_id)
  end
end
