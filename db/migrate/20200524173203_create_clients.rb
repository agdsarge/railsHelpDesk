class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :home_address
      t.string :isp_id
      t.string :integer

      t.timestamps
    end
  end
end
