defmodule Todo.Tasks do
  alias Todo.Repo
  import Ecto.Query

  @moduledoc """
  Context module for tasks
  """
  @spec list_by_group(group_id :: pos_integer()) :: [%Todo.Tasks.Task{}]
  def list_by_group(group_id) do
    query =
      from t in Todo.Tasks.Task,
        where: t.group_id == ^group_id

    Repo.all(query)
  end

  def create(task_params) do
    %Todo.Tasks.Task{}
    |> Todo.Tasks.Task.changeset(task_params)
    |> Repo.insert!()
  end
end
