class Ticket < ApplicationRecord
    belongs_to :client
    belongs_to :professional
    has_many :comments
    accepts_nested_attributes_for :comments, allow_destroy: true
end
