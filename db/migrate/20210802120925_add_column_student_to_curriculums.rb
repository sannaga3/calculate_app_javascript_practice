class AddColumnStudentToCurriculums < ActiveRecord::Migration[6.0]
  def change
    add_column :curriculums, :student, :string
  end
end
