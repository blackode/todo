defmodule Todo.Dependencies do
  @moduledoc false
  import Ecto.Query
  alias Todo.Tasks.Dependency
  alias Todo.Repo

  def create(%{"task_id" => _task_id, "dependency_id" => _dependency_task} = params) do
    %Dependency{}
    |> Dependency.changeset(params)
    |> Repo.insert!()
  end

  def get_task_dependencies(task_id) do
    query =
      from d in Dependency,
        where: d.task_id == ^task_id,
        group_by: d.task_id

    Repo.all(query)
  end
end
