require 'rails_helper'
require 'rspec/rails'

RSpec.describe Professional do
    before do
        @vz = Isp.create(name: 'Verizon FiOS', email: 'support@verizon.com')
        @pn = Client.create(name: 'Paul Nicholsen', username: "p.nicholsen", password: "password", phone_number: '202 555 5678', email: 'p.nicholsen@flatiron.com', home_address: '1600 Pennsylvania Ave', isp_id: @vz.id)
        @fb = Professional.create(name: "Frodo Baggins", username: "f.baggins", password: "onering", email: 'frodo@greenleaf.com', specialty: 'routers')
        @mb = Professional.create(name: "Merry Brandybuck", username: "mb", password: "rohan", email: 'merry@greenleaf.com', specialty: 'routers')
        @sg = Professional.create(name: "Sam Gamgee", username: "sgamgee", password: "garden", email: 'sam@greenleaf.com', specialty: 'wifi')
        @tckt = Ticket.create(description: "routers", client: @pn, professional: @fb, open: true)
    end
    
    describe "#specialty" do
        it "returns the specialty of the professional, testing the attribute" do
            expect(@fb.specialty).to eq("routers")
        end
        it "returns the specialty of the professional, testing the attribute" do
            expect(@mb.specialty).to eq("routers")
        end
        it "returns the specialty of the professional, testing the attribute" do
            expect(@sg.specialty).to eq("wifi")
        end
    end

    describe ".find_least_busy_pro" do
        it "assigns a task description to the first least-busy professional with that specialty" do 
            expect(Professional.find_least_busy_pro("wifi")).to eq(@sg)
        end

        it "assigns a task description to the first least-busy professional with that specialty" do 
            expect(Professional.find_least_busy_pro("routers")).to eq(@mb)
            #not @fb, even though he is the first router specialist, he is already busy.
        end

        it "assigns a task description (that is no one's specialty) to the first least-busy professional" do
            expect(Professional.find_least_busy_pro("nonsense")).to eq(@mb)
            #not sg, because mb is 'first' in the queue
        end
    end


end