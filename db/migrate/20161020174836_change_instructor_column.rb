class ChangeInstructorColumn < ActiveRecord::Migration
  def up
    change_column :instructors, :level, :integer, default:3
  end

  def down
    change_column :instructors, :level, :integer, default:nil
  end
end
