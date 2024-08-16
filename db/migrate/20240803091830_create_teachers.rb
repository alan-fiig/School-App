class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :last_name
      t.date :birthdate
      t.integer :telephone
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
