defmodule Brew.Repo.Migrations.CreateWorkTime do
  use Ecto.Migration

  def change do
    create table(:worktimes) do
      add :workTime, :integer
      add :startTime, :string

      timestamps
    end

  end
end
