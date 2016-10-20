class AddLevelToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :level, :integer
  end
end
