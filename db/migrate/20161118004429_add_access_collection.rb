class AddAccessCollection < ActiveRecord::Migration
  def up
    add_column :collections, :access_level, :int
  end

  def down
    add_column :collections, :access_level, :int
  end
end
