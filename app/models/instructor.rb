class Instructor < User
  has_many :collections
  attr_accessible :collections
  @privilege = "Instructor"
end
