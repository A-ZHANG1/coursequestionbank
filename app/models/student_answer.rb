class StudentAnswer < ActiveRecord::Base
  attr_accessible :attempt, :correctness, :problem_uid, :last_used, :updated_at, :created_date
  belongs_to :instructor
  belongs_to :question
end
