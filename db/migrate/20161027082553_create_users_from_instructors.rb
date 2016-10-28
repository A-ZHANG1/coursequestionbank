class CreateUsersFromInstructors < ActiveRecord::Migration
  def up
    Instructor.find_each do |instructor|
      on_whitelist = Whitelist.find_by_username(instructor.username)
      params = {:name => instructor.name,
               :provider => instructor.provider,
               :uid => instructor.uid,
               :current_collection => instructor.current_collection,
               :provider_image => instructor.provider_image,
               :provider_email => instructor.provider_email,
               :username => instructor.username}
      if on_whitelist and on_whitelist.privilege == "admin"
        Admin.create(params)
      else
        Instructor.create(params)
      end
    end
  end

  def down
    User.delete_all
  end
end
