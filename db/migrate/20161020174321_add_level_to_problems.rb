class AddLevelToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :level, :integer
  end
end
