class AddStudentRefToCurriculums < ActiveRecord::Migration[6.0]
  def change
    add_reference :curriculums, :student, foreign_key: true
  end
end
