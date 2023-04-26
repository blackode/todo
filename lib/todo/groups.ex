defmodule Todo.Groups do
  alias Todo.Repo
  alias Todo.Tasks.Group
  import Ecto.Query

  @moduledoc """
  Context module for groups
  """
  @spec create_group(map()) :: {:ok, %Group{}} | {:error, Ecto.Changeset}
  def create_group(%{"name" => _name} = group_params) do
    %Group{}
    |> Group.changeset(group_params)
    |> Repo.insert()
  end

  @spec get(pos_integer()) :: %Group{}
  def get(id) do
    Repo.get!(Group, id)
  end

  def list_groups() do
    query =
      from g in Group,
        left_join: t in Todo.Tasks.Task,
        on: t.group_id == g.id,
        group_by: [g.id, g.name],
        select: %{
          id: g.id,
          name: g.name,
          total_tasks: fragment("COUNT(?)", t.id),
          tasks_completed_count: fragment("SUM(CASE WHEN ? THEN 1 ELSE 0 END)", t.completed)
        }

    Repo.all(query)
  end
end
