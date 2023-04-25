defmodule Todo.Repo.Migrations.CreateDependencies do
  use Ecto.Migration

  def change do
    create table(:dependencies) do
      add :task_id, references(:tasks, on_delete: :nothing)
      add :dependency_id, references(:tasks, on_delete: :nothing)

      timestamps()
    end

    create index(:dependencies, [:task_id])
    create index(:dependencies, [:dependency_id])
  end
end
