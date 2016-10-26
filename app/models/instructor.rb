class Instructor < User
  has_many :collections

  def initialize(auth)
    super(auth)
    @privilege = "Instructor"
  end
end
