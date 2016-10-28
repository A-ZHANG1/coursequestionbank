class Admin < Instr
  has_many :collections
  has_many :problems
  attr_accessible :collections
  attr_accessible :problems
  @privilege = "Admin"
end
