defmodule MediaServer.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table("files") do
      add(:uuid, :string)
      add(:date_create, :utc_datetime)
      add(:check_sum, :string)
      add(:extention, :string)
      add(:name, :string)
      add(:from, :utc_datetime)
      add(:to, :utc_datetime)
    end

    create table("tags") do
      add(:name, :string)
      add(:owner, :string)
      add(:type, :string)
    end

    create unique_index(:tags, [:name])

    create table("file_tags") do
      add(:file_id, references(:files, on_delete: :delete_all))
      add(:tag_id, references(:tags))
    end
  end
end
