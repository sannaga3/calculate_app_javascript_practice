class RemoveStudentFromCurriculums < ActiveRecord::Migration[6.0]
  def change
    remove_column :curriculums, :student, :string
  end
end
