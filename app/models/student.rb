class Student < User
  def initialize(auth)
    super(auth)
    @privilege = "Student"
  end
end
