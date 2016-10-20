class ChangeColumn < ActiveRecord::Migration
  def up
    change_column :collections, :level, :integer, default:3
  end

  def down
    change_column :collections, :level, :integer, default:nil
  end
end
