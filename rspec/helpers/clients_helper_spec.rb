require 'rails_helper'

Rspec.describe Client, "client#first_name" do
    context "takes in a full name" do
        it "returns the first name of the given person" do
        james_woods = Client.new(name: "James Woods")
        james_woods.first_name
        expect(james_woods.first_name).to include ("James")
        end
    end
end