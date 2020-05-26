class CreateProfessionals < ActiveRecord::Migration[6.0]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :specialty
      t.string :email

      t.timestamps
    end
  end
end
