class Client < ApplicationRecord
    belongs_to :isp
    has_many :tickets
    has_many :professionals, through: :tickets
end
