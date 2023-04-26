# Create 5 groups
groups =
  Enum.map(1..5, fn i ->
    %{
      "name" => "Task Group #{i}",
      "completed" => false
    }
  end)

groups = Todo.create_groups(groups)

# Create 5 tasks in each group
Enum.each(groups, fn group ->
  tasks =
    Enum.map(1..5, fn i ->
      task_name =
        cond do
          i == 1 -> "Locked Task"
          i == 4 -> "Completed Task"
          true -> "Incomplete Task"
        end

      %{
        "name" => task_name,
        "completed" => i == 4,
        "locked" => i == 1,
        "group_id" => group.id
      }
    end)

  tasks = Todo.create_tasks(tasks)

  # Assign dependencies to each task
  Todo.assign_dependencies(1, [3])
end)

IO.puts("Seed data for Groups, Tasks, and Dependencies are created Successfully!")
