class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.date :birthdate
      t.integer :telephone
      t.string :email
      t.string :password_digest
      t.integer :grade
      t.string :group

      t.timestamps
    end
  end
end
