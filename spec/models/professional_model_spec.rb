require 'rails_helper'
require 'rspec/rails'

RSpec.describe Professional do
    before do
        @vz = Isp.create(name: 'Verizon FiOS', email: 'support@verizon.com')
        @pn = Client.create(name: 'Paul Nicholsen', username: "p.nicholsen", password: "password", phone_number: '202 555 5678', email: 'p.nicholsen@flatiron.com', home_address: '1600 Pennsylvania Ave', isp_id: @vz.id)
        @fb = Professional.create(name: "Frodo Baggins", username: "f.baggins", password: "onering", email: 'frodo@greenleaf.com', specialty: 'routers')
    end
    


end