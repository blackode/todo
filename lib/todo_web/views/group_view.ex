defmodule TodoWeb.GroupView do
  use TodoWeb, :view

  def group_status(group) do
    "#{group.tasks_completed_count} of #{group.total_tasks} completed"
  end
end
