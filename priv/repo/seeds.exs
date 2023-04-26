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
      %{
        "name" => "Task #{i} in #{group.name}",
        "completed" => false,
        "locked" => false,
        "group_id" => group.id
      }
    end)

  tasks = Todo.create_tasks(tasks)

  # Assign dependencies to each task
  [task, dependency_task] = Enum.take_randon(2)
  Todo.assign_dependencies(task.id, [dependency_task.id])
end)

IO.puts("Seed data for Groups, Tasks, and Dependencies are created Successfully!")
