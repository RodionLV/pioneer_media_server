defmodule MediaServer.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table("files") do
      add(:uuid, :string)
      add(:check_sum, :string)
      add(:extention, :string)
      add(:name, :string)

      add(:action_id, references(:actions))
    end

    create unique_index(:files, [:uuid])
  end
end
