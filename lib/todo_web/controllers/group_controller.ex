defmodule TodoWeb.GroupController do
  use TodoWeb, :controller
  alias Todo.Groups

  def index(conn, _params) do
    groups = Groups.list()
    render(conn, "index.html", groups: groups)
  end
end
