class ChangeDataAverageScoreToCurriculum < ActiveRecord::Migration[6.0]
  def change
    change_column :curriculums, :average_score, :float
  end
end