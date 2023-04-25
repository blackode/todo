defmodule Todo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :completed, :boolean, default: false, null: false
      add :locked, :boolean, default: false, null: false
      add :group_id, references(:groups, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:group_id])
  end
end
