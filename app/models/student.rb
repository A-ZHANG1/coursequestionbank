class Student < User
  attr_accessor :current_collection
  has_many :collections
end
