class AddPrivilegeColumn < ActiveRecord::Migration
  def up
    add_column :instructors, :privilege, :string
    Instructor.find_each do |instructor|
      on_whitelist = Whitelist.find_by_username(instructor.username)
      if on_whitelist
        instructor.privilege = on_whitelist.privilege.capitalize
        instructor.save!
      end
    end
  end

  def down
    remove_column :instructors, :privilege
  end
end
