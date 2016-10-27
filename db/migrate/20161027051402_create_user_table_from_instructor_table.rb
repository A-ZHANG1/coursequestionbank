class CreateUserTableFromInstructorTable < ActiveRecord::Migration
  def up
    add_column :instructors, :privilege, :string
    Instructor.find_each do |instructor|
      user = Whitelist.find_by_username(instructor.username)
      if user.nil?
        instructor.privilege = "Student"
      else
        instructor.privilege = user.privilege.capitalize
      end
      # instructor.privilege = Whitelist.find_by_username(instructor.username).privilege.capitalize
      instructor.save!
    end
  end

  def down
    rename_table :users, :instructions
    remove_column :instructions, :privilege
  end
end
