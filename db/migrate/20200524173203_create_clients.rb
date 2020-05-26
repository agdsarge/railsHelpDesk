class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :phone_number
      t.string :email
      t.string :home_address
      t.integer :isp_id
      

      t.timestamps
    end
  end
end
