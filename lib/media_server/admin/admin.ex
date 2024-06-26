defmodule MediaServer.Admin do
  require Logger

  alias MediaServer.Repo
  alias MediaServer.Users
  alias MediaServer.Tags

  import Ecto.Query

  def get_users() do
    from(u in Users.User, join: g in assoc(u, :groups), where: "ADMIN" != g.name)
    |> Repo.all()
    |> Repo.preload(:tags)
    |> Repo.preload(:groups)
  end

  def get_groups() do
    Users.Group
    |> Repo.all()
  end

  def get_groups(list_groups) do
    from(g in Users.Group, where: g.name in ^list_groups)
    |> Repo.all()
  end

  def set_active_user!(user_id, bool) do
    Users.get_by_id(user_id)
    |> Users.User.changeset(%{
      active: bool
    })
    |> Repo.update!()
  end
end
