class StudentAnswerController < ApplicationController
  # :attempt, :correctness, :problem_uid, :last_used, :updated_at, :created_date
  def create

    debugger
    # new answer
    answer = StudentAnswer.new(:attempt => params[:attempt],
                               :correctness => params[:correctness],
                               :problem_uid => params[:problem_uid],
                               :instructor_id => params[:instructor_id],
                               :created_at => DateTime.current
    )
    answer.save

    # add answer to problem
    # problem = Problem.find(params[:problem_id])
    # problem.student_answers << answer
    # problem.save
    #
    # # add answer to student
    # instrucotr = Instructor.find(params[:instructor_id])
    # instrucotr.student_answers << answer
    # instrucotr.save
  end
end
