class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.integer :grade
      t.string :group
      t.string :name_subject

      t.timestamps
    end
  end
end
