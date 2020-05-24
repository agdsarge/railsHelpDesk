class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :description
      t.boolean :open
      t.integer :client_id
      t.integer :professional_id

      t.timestamps
    end
  end
end
