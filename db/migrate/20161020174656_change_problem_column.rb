class ChangeProblemColumn < ActiveRecord::Migration
  def up
    change_column :problems, :level, :integer, default:3
  end

  def down
    change_column :problems, :level, :integer, default:nil
  end
end
