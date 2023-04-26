defmodule Todo.Groups do
  alias Todo.Repo
  alias Todo.Tasks.Group
  import Ecto.Query

  @moduledoc """
  Context module for groups
  """
  @spec create(map()) :: {:ok, %Group{}} | {:error, Ecto.Changeset}
  def create(group_params) do
    %Group{}
    |> Group.changeset(group_params)
    |> Repo.insert!()
  end

  @spec get(pos_integer()) :: %Group{}
  def get(id) do
    Repo.get!(Group, id)
  end

  def list() do
    query =
      from g in Group,
        left_join: t in Todo.Tasks.Task,
        on: t.group_id == g.id,
        group_by: [g.id, g.name],
        order_by: [asc: g.id],
        select: %{
          id: g.id,
          name: g.name,
          total_tasks: fragment("COUNT(?)", t.id),
          tasks_completed_count: fragment("SUM(CASE WHEN ? THEN 1 ELSE 0 END)", t.completed)
        }

    Repo.all(query)
  end
end
