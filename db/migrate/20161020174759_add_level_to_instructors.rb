class AddLevelToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :level, :integer
  end
end
