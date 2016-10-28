class Instructor < ActiveRecord::Base

  attr_accessible :name, :username, :uid, :provider, :provider_image, :provider_email, :privilege, :collections, :problem

  has_many :collections
  has_many :problems
  def self.dev_users
    where(:provider => "developer")
  end

  def admin?
    privilege == "Admin"
  end

  def instructor?
    privilege == "Instructor"
  end

  def student?
    privilege == "Student"
  end
  #
  # attr_accessible :name,
  #                 :username,
  #                 :uid,
  #                 :provider,
  #                 :provider_image,
  #                 :provider_email,
  #                 :privilege

  # def level
  #   if admin?
  #     return 0
  #   elsif student?
  #     return 3
  #   else
  #     return 1
  #   end
  # end

  # def string_rep
  #   if admin?
  #     return "admin"
  #   elsif student?
  #     return "student"
  #   else
  #     return "instructor"
  #   end
  # end

  def privilege
    # debugger
    # if username.nil?
    #   username = "saas"
    # end
    whitelist = Whitelist.find_by_username_and_provider(username, provider)

    if whitelist
      return whitelist.privilege.capitalize
    else
      return "Student"
    end
  end

  # def admin?
  #   return privilege == "admin"
  # end
  #
  # def instructor?
  #   return privilege == "instructor"
  # end
  #
  # def student?
  #   return privilege == "student"
  # end
# >>>>>>> origin/migration-2
end
