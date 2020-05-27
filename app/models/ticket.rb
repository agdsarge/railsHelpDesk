class Ticket < ApplicationRecord
    belongs_to :client
    belongs_to :professional
    has_many :comments
    accepts_nested_attributes_for :comments, allow_destroy: true


    def find_professionals
        prof_id_arr = []
        Professional.all.each do |professional|
            if professional.specialty == self.description
                prof_id_arr << professional.id
            end 
        end
        Ticket.find_professional(prof_id_arr)
    end

    def self.find_professional(prof_id_arr)
        prof_id_array = []
        self.all.each do |ticket|
            if ticket.professional_id == prof_id_arr
                prof_id_array << ticket.professional_id
            end
        end
        byebug
        prof_id_array
    end
end
