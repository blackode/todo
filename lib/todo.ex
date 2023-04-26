defmodule Todo do
  @moduledoc """
  Todo keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @spec create_groups([map]) :: :ok
  def create_groups(groups) do
    Enum.map(groups, &Todo.Groups.create/1)
  end

  @spec create_tasks([map]) :: [%Todo.Tasks.Task{}]
  def create_tasks(tasks) do
    Enum.map(tasks, &Todo.Tasks.create/1)
  end

  @spec create_tasks([map]) :: :ok
  def assign_dependencies(task_id, task_dependencies) do
    Enum.each(task_dependencies, fn task_dependency_id ->
      params = %{"task_id" => task_id, "dependency_id" => task_dependency_id}
      Todo.Dependencies.create(params)
    end)
  end
end
