# TodoThinkBridge

TodoThinkBridge is a web-based application for managing tasks and groups. It is built with the Phoenix framework, and uses PostgreSQL as its database.

## Running Phoenix Server
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

I have manually added the seeds.ex file that do insertions into groups, tasks, and dependencies

## Getting Started

To get started with TodoThinkBridge, follow these steps:

1. Clone the repository: `git clone https://github.com/blackode/todo.git`
2. Install dependencies with `mix deps.get`
3. Configure the database connection in `config/dev.exs`
4. Create the database with `mix ecto.create`
5. Run database migrations with `mix ecto.migrate`
6. Seed the database with `mix run priv/repo/seeds.exs`
7. Start the Phoenix server with `mix phx.server`

Now you can visit `http://localhost:4000` in your web browser to access TodoThinkBridge.

## Routes

TodoThinkBridge has the following routes:

- `GET /groups`: displays a list of all groups in the database, with links to their corresponding tasks
- `GET /groups/{group_id}/tasks`: displays a list of all tasks in the group.

## Seeding the Database

To seed the database with sample data, you can use the `mix run priv/repo/seeds.exs` file. This file defines Elixir modules that insert sample groups, tasks, and dependencies into the database.

This will insert the sample data into the database.

