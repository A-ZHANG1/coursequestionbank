class Instructor < ActiveRecord::Base

  attr_accessible :name, :username, :uid, :provider, :provider_image, :provider_email, :privilege, :collections, :problem

  has_many :collections
  has_many :problems
  def self.dev_users
    where(:provider => "developer")
  end

  def self.create_via_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      if auth["info"]["name"] and !auth["info"]["name"].empty?
        user.name = auth["info"]["name"]
      else
        user.name = auth["info"]["nickname"]
      end
      user.username = auth["info"]["nickname"]
      user.provider_image = auth["info"]["image"]
      user.provider_email = auth["info"]["email"]
      user.privilege = "Student"
    end
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
