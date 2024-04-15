defmodule MediaServer.Users do
  require Logger

  alias MediaServer.Repo
  alias MediaServer.Users

  def get_by_login(login), do:
    Repo.get_by(Users.User, login: login)
    |> Repo.preload(:tags)
    |> Repo.preload(:groups)
end
