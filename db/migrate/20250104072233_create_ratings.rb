class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :student, null: false, foreign_key: true
      t.references :teacher_subject, null: false, foreign_key: true
      t.decimal :first_partial
      t.decimal :second_partial
      t.decimal :third_partial

      t.timestamps
    end
  end
end
