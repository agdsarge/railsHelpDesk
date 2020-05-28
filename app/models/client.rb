class Client < ApplicationRecord
    belongs_to :isp
    has_many :tickets
    has_many :professionals, through: :tickets
    has_secure_password

    def first_name
        self.name.split[0]
    end

    def last_name
        self.name.split[-1]
    end

    def client_info
        [self.name, self.email, self.home_address, self.phone_number]
    end

    def client_open_tix
        Ticket.all.select {|t| t.client == self && t.open}
    end

    def client_closed_tix
        Ticket.all.select {|t| t.client == self && !t.open}
    end

end
