Class Instr < Student
  has_many :problems
  has_many :collections
  attr_accessible :collections
  attr_accessible :problems
end
