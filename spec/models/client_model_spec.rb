require 'rails_helper'
require 'rspec/rails'


RSpec.describe Client do
    before do
        @vz = Isp.create(name: 'Verizon FiOS', email: 'support@verizon.com')
        @pn = Client.create(name: 'Paul Nicholsen', username: "p.nicholsen", password: "password", phone_number: '202 555 5678', email: 'p.nicholsen@flatiron.com', home_address: '1600 Pennsylvania Ave', isp_id: @vz.id)
    end
    describe "#first_name" do
        it "returns the first name of the given person" do
            expect(@pn.first_name).to eq("Paul")
        end
    end

    describe "#last_name" do
        it "returns the last name of the given person" do
            expect(@pn.last_name).to eq("Nicholsen")
        end
    end

    describe "#ISP" do
        it "returns the name of the given person's ISP, testing the relation" do
            expect(@pn.isp.name).to eq("Verizon FiOS")
        end
    end

    describe "#email" do
        it "returns the name of the given person's ISP, testing the relation" do
            expect(@pn.email).to eq("p.nicholsen@flatiron.com")
        end
    end

    describe "#uniqueness" do
        subject { Client.create(name: 'Peter Nicholsen', username: "p.nicholsen", password: "password", phone_number: '202 555 5678', email: 'p.nicholsen@flatiron.com', home_address: '1600 Pennsylvania Ave', isp_id: @vz.id)}
        it "validates the uniqueness of a username" do
            should validate_uniqueness_of(:username)
        end
    end
end