defmodule TodoWeb.TaskView do
  use TodoWeb, :view

  def task_status(task) do
    cond do
      task.locked -> "locked"
      task.completed -> "completed"
      true -> "default"
    end
  end
end
