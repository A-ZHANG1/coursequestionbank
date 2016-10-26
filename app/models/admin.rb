class Admin < User
  def initialize(auth)
    super(auth)
    @privilege = "Admin"
  end
end
