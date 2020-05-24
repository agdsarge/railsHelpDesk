class Professional < ApplicationRecord
    has_many :tickets
    has_many :clients, through: :tickets
end
