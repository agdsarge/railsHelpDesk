require 'rails_helper'

Rspec.describe Client do
    describe "#first_name" do
        vz = Isp.create(name: 'Verizon FiOS', email: 'support@verizon.com')
        pn = Client.create(name: 'Paul Nicholsen', username: "p.nicholsen", password: "password", phone_number: '202 555 5678', email: 'p.nicholsen@flatiron.com', home_address: '1600 Pennsylvania Ave', isp_id: vz.id)
        paul = pn.first_name

        it "returns the first name of the given person" do
            expect(paul).to be_an_instance_of('paul')
        end
    end
end