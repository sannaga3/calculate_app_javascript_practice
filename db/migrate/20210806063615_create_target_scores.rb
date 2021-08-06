class CreateTargetScores < ActiveRecord::Migration[6.0]
  def change
    create_table :target_scores do |t|
      t.integer :math
      t.integer :english
      t.integer :science
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
