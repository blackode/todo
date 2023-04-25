defmodule Todo.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed, :boolean, default: false
    field :locked, :boolean, default: false
    field :name, :string
    field :group_id, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :completed, :locked])
    |> validate_required([:name, :completed, :locked])
  end
end
