class Instructor < User
  has_many :collections
  @privilege = "Instructor"
end
