class ChangeDataAverageScoreToCurriculum < ActiveRecord::Migration[6.0]
  def down
    change_column :curriculums, :average_score, :integer
  end

  def up
    change_column :curriculums, :average_score, :float
  end
end