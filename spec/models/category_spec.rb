require "rails_helper"

describe Category do
    let(:attributes) do
        {
            name: "newCategory"
        }
    end

    it "is considered valid" do
        expect(Category.new(attributes)).to be_valid
    end
end
