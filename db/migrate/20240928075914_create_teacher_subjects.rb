class CreateTeacherSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :teacher_subjects do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.integer :grade
      t.string :group

      t.timestamps
    end
  end
end
