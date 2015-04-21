require 'rails_helper'

RSpec.describe Availability, type: :model do
  context 'with valid attributes' do

      it 'creates a new availability' do
        availability = FactoryGirl.create(:availability)
        expect(availability).to_not be_nil
      end

    end

    context "with invalid attributes" do

      it "won't create availability with non-integer id" do
        availability  = FactoryGirl.build(:availability, activity_id: "jhgsd")
        expect(availability).to_not be_valid
      end

      it "won't create availabilty with empty start_at" do
        availability  = FactoryGirl.build(:availability, starts_at: "")
        expect(availability).to_not be_valid
      end

      it " won't create availability with non-integer price " do
        availability = FactoryGirl.build(:availability, price: "ljhdb")
        expect(availability).to_not be_valid
      end

      it "won't create availability with negative price" do
        availability = FactoryGirl.build(:availability, price: -4 )
        expect(availability).to_not be_valid
      end

    end
end
