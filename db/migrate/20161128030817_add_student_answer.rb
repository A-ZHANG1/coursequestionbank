class AddStudentAnswer < ActiveRecord::Migration
  def up
    create_table :student_answer do |a|

      a.timestamps
      a.references :instructor
      a.references :problem
    end
  end

  def down
  end
end
