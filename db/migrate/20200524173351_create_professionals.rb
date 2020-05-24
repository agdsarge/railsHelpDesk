class CreateProfessionals < ActiveRecord::Migration[6.0]
  def change
    create_table :professionals do |t|
      t.string :username
      t.string :specialty
      t.string :email

      t.timestamps
    end
  end
end
