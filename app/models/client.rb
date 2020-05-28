class Client < ApplicationRecord
    belongs_to :isp
    has_many :tickets
    has_many :professionals, through: :tickets
    has_secure_password
    validates :username, uniqueness: true
    validate :unique_username

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

    private
    def unique_username
        if  Professional.all.pluck(:username).include?(username)
            errors.add(:username, 'This username is already taken')
        end
    end

end
