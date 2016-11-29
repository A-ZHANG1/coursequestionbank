class StudentAnswerController < ApplicationController
  # :attempt, :correctness, :problem_uid, :last_used, :updated_at, :created_date
  def create
    # new answer
    answer = StudentAnswer.new(:attempt => params[:attempt],
                               :correctness => params[:correctness],
                               :problem_uid => params[:problem_uid]
    )

    # add answer to problem
    Problem.find(params[:problem_id]).student_answers << answer

    # add answer to student
    Instructor.find(params[:instructor_id]).student_answers << answer
  end
end
