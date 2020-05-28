require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  Rspec.describe Client, "#first_name" do
    context "takes in a full name" do
      it "returns the first name of the given person" do
        james_woods = Client.new(name: "James Woods")
        james_woods.first_name
        expect(james_woods.first_name).to eq ("James")
      end
    end
  end


end
