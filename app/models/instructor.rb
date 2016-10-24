class Instructor < ActiveRecord::Base

  attr_accessible :name, :username, :uid, :provider, :provider_image, :provider_email, :current_collection
  has_many :collections
  has_many :problems

  def self.create_with_omniauth(auth)
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
    end
  end
  
  def level
    if admin?
      return 0
    elsif student?
      return 3
    else
      return 1
    end
  end

  def privilege
    # debugger
    # if username.nil?
    #   username = "saas"
    # end
    whitelist = Whitelist.find_by_username_and_provider(username, provider)

    if whitelist
      return whitelist.privilege 
    else 
      return "student"
    end 
  end

  def admin?
    return privilege == "admin"
  end

  def instructor?
    return privilege == "instructor"
  end
  
  def student?
    return privilege == "student"
  end
end
