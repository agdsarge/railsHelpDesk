class Ticket < ApplicationRecord
    belongs_to :client
    belongs_to :professional
    has_many :comments
end
