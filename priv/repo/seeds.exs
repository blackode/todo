# Create 5 groups
groups = Enum.map(1..5, fn i ->
  %Todo.Group{
    name: "Group #{i}",
    completed: false
  }
end)

groups = Todo.create_groups(groups)

# Create 5 tasks in each group
Enum.each(groups, fn group ->
  tasks = Enum.map(1..5, fn i ->
    %Todo.Task{
      name: "Task #{i} in #{group.name}",
      completed: false,
      locked: false,
      group_id: group.id
    }
  end)

  tasks = Todo.create_tasks(tasks)

  # Assign dependencies to each task
  Enum.each(tasks, fn task ->
    # Select 1-3 random dependencies for the task
    dependencies = Enum.shuffle(tasks)
      |> Enum.reject(fn t -> t.id == task.id end)
      |> Enum.take_random(Enum.random_between(1, 3))
      |> Enum.map(& &1.id)
    Todo.assign_dependencies(task, dependencies)
  end)
end)

IO.puts("Seed data for Groups, Tasks, and Dependencies are created Successfully!")
