defmodule Todo.Tasks do
  alias Todo.Repo
  import Ecto.Query

  @moduledoc """
  Context module for tasks
  """
  def list_by_group(group_id) do
    Todo.Tasks.Task
    |> where(group_id: ^group_id)
    |> preload(:group)
    |> Repo.all()
  end

  def create(task_params) do
    %Todo.Tasks.Task{}
    |> Todo.Tasks.Task.changeset(task_params)
    |> Repo.insert!()
  end
end
