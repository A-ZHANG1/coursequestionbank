require 'spec_helper'

describe StudentanswersController do

		it 'initiate student answer model' do
			#problem = Problem.create(:is_public => true).id
			answer = Studentanswer.new(:attempt => "1", :correctness => true, :problem_uid => 1, :instructor_id => 2, :id => 1)
			expect(answer.attempt).to eq("1")
			expect(answer.correctness).to eq(true)
			expect(answer.problem_uid).to eq(1)
			expect(answer.instructor_id).to eq(2)

			#@answerList = Studentanswer.where(:problem_uid => 1).where(:instructor_id => 2)
			expect(answer.first).to eq(false)
			answer2 = Studentanswer.new(:attempt => "2", :correctness => false, :problem_uid => 1, :instructor_id => 2, :id => 2)
			expect(answer2.first).to eq(true)
		end
end

