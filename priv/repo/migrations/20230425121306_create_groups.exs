defmodule Todo.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :completed, :boolean, default: false, null: false

      timestamps()
    end
  end
end
