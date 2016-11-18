class AddAccessProblem < ActiveRecord::Migration
  def up
    add_column :problems, :access_level, :int
  end

  def down
    add_column :problems, :access_level, :int
  end
end
