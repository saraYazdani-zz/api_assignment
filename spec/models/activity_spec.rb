require 'rails_helper'

RSpec.describe Activity, type: :model do

      context 'with valid attributes' do

        it 'creates a new activity' do
          activity = FactoryGirl.create(:activity)
          expect(activity).to_not be_nil
        end

        it 'creates a new activity that is active' do
          activity = FactoryGirl.create(:activity)
          expect(activity.is_active).to be_truthy
        end

    end

      context 'with invalid attributes' do

        it "won't create activity with empty title" do
          activity = FactoryGirl.build(:activity, title: "")
          expect(activity).to_not be_valid
        end

        it "won't create activity with empty description" do
          activity = FactoryGirl.build(:activity, description: "")
          expect(activity).to_not be_valid
        end

        it "won't create activity with empty price" do
          activity = FactoryGirl.build(:activity, price: "")
          expect(activity).to_not be_valid
        end

        it "won't create activity with non-integer price" do
          activity = FactoryGirl.build(:activity, price: "dsd")
          expect(activity).to_not be_valid
        end

        it "won't create activity with negative price" do
          activity = FactoryGirl.build(:activity, price: -100)
          expect(activity).to_not be_valid
        end
        it "won't create activity with empty currency" do
          activity = FactoryGirl.build(:activity, currency: "")
          expect(activity).to_not be_valid
        end

        it "won't create activity with empty city" do
          activity = FactoryGirl.build(:activity, city: "")
          expect(activity).to_not be_valid
        end

        it "won't create activity with empty country" do
          activity = FactoryGirl.build(:activity, country: "")
          expect(activity).to_not be_valid
        end

        it "won't create activity with empty country" do
          activity = FactoryGirl.build(:activity, country: "")
          expect(activity).to_not be_valid
        end

      end
  end
