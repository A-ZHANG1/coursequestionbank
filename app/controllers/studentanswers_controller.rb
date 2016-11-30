class StudentanswersController < ApplicationController
  # :attempt, :correctness, :problem_uid, :last_used, :updated_at, :created_date
  def create

    # new answer

    # debugger
    answer = Studentanswer.new()
    answer.attempt =  params[:attempt]
    answer.correctness = params[:correctness]
    answer.problem_uid = params[:problem_uid]
    answer.instructor_id =  @current_user.id
    answer.created_at = DateTime.current


    answer.save

    if request.xhr?
      render :json => {'error' => nil}
    else
      redirect_to problems_path
    end

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
