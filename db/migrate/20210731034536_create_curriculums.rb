class CreateCurriculums < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculums do |t|
      t.integer :math
      t.integer :english
      t.integer :science
      t.integer :total_score
      t.integer :average_score
      t.string :grade
      t.string :remarks

      t.timestamps
    end
  end
end
