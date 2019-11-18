require "rails_helper"

RSpec.describe User, type: :model do
    let(:attributes) do
        {
            email: "erin@test.com",
            password: "test123",
            password_confirmation: "test123",
            name: "erin"
        }
    end

    it "is considered valid" do
        expect(User.new(attributes)).to be_valid
    end

    it "is invalid if the password and password_confirmation don't match" do
        user = User.new
        user.password = 'foo'
        user.password_confirmation = 'fo0'
        expect(user.valid?).to be false
    end

    it "is invalid if password and password_confirmation are both nil" do
        user = User.new
        user.password = nil
        user.password_confirmation = nil
        expect(user.valid?).to be false
    end

    it "has a password confirmation field" do
        expect(User.new).to respond_to(:password_confirmation)
    end

    it "has a name field" do
        expect(User.new).to respond_to(:name)
    end
     


end
