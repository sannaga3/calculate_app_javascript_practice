class CreateDoubleChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :double_checks do |t|
      t.string :teacher_name
      t.boolean :check
      t.string :comment
      t.references :curriculum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
