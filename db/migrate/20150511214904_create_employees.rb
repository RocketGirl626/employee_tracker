class CreateEmployees < ActiveRecord::Migration
  def change
    create_table(:employees) do |e|
      e.column(:name, :string)

      e.timestamps()
    end
    create_table(:divisions) do |d|
      d.column(:name, :string)

      d.timestamps()
    end
  end
end
