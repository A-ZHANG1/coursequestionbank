class StudentAnswerController < ApplicationController
  # :attempt, :correctness, :problem_uid, :last_used, :updated_at, :created_date
  def create
    answer = StudentAnswer.new(:attempt => params[:attempt],
                               :correctness => params[:correctness],
                               :problem_uid => params[:problem_uid]
    )
    Problem.find(params[:problem_id]).student_answers << answer
    Instructor.find(params[:instructor_id]).student_answers << answer
  end
end