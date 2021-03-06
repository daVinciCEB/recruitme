defmodule RecruitmeLocationTest.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :location, :geometry

      timestamps()
    end

  end
end
