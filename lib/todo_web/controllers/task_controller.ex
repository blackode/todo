defmodule TodoWeb.TaskController do
  use TodoWeb, :controller
  alias Todo.Tasks
  alias Todo.Groups

  def index(conn, %{"group_id" => group_id}) do
    tasks = Tasks.list_by_group(group_id)
    group = Groups.get(group_id)

    IO.inspect(group,
      label: "<<<<<<<<<< groupj >>>>>>>>>>",
      limit: :infinity,
      printable_limit: :infinity
    )

    render(conn, "index.html", tasks: tasks, group: group)
  end
end
