class AddPasswordDigestToProfessionals < ActiveRecord::Migration[6.0]
  def change
    add_column :professionals, :password_digest, :string
  end
end
