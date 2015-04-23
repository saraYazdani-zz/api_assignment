require 'rails_helper'

RSpec.describe Api::V1::AvailabilitiesController, :type => :controller do

  describe "GET index" do
    it "returns all activity availabilities" do

      activity1 = FactoryGirl.create(:activity)
      activity2 = FactoryGirl.create(:activity)
      a1 = FactoryGirl.create(:availability, activity: activity1)
      a2 = FactoryGirl.create(:availability, activity: activity1)
      a3 = FactoryGirl.create(:availability, activity: activity2)

      data = {}
      data[:format] = "json"
      data[:activity_id] = activity1.id

      get :index, data
      expect(response.status).to eq 200
      expect(ActiveSupport::JSON.decode(response.body)['availabilities'].count).to eq 2
    end

    it "returns all availabilities" do
      activity1 = FactoryGirl.create(:activity)
      activity2 = FactoryGirl.create(:activity)
      a1 = FactoryGirl.create(:availability, activity: activity1)
      a2 = FactoryGirl.create(:availability, activity: activity1)
      a3 = FactoryGirl.create(:availability, activity: activity2)

      data = {}
      data[:format] = "json"

      get :index, data
      expect(response.status).to eq 200
      expect(ActiveSupport::JSON.decode(response.body)['availabilities'].count).to eq 3

    end

  end

  describe "GET show" do
    it "shows activity availability" do
      activity = FactoryGirl.create(:activity)
      availability= FactoryGirl.create(:availability, activity: activity)

      data = {
        :format => "json",
        :id => availability.id
      }

      get :show, data
      expect(response.status).to eq 200
      hash = ActiveSupport::JSON.decode(response.body)
      expect(hash[:id] == availability.id)
      expect(hash[:activity_id] == availability.activity_id)
      expect(hash[:starts_at] == availability.starts_at)
    end
  end

  describe "POST create" do
    it " creates new availability " do
      activity = FactoryGirl.create(:activity)
      data = FactoryGirl.build(:availability, activity_id: activity.id).
        attributes.except("id", "created_at", "updated_at")
      data[:format] = "json"

      expect {
        post :create, data
      }.to change(Availability, :count).by(1)

      expect(response.status).to eq 201

    end

    it " does not create availability for invalid activity_id " do
      data = FactoryGirl.build(:availability, activity_id: 690).
          attributes.except("id", "created_at", "updated_at")
      data[:format] = "json"

      post :create, data
      expect(response.status).to eq 422

    end
  end

  describe "PUT update" do
    it "updates the availability attributes" do


      activity =  FactoryGirl.create(:activity)
      availability = FactoryGirl.create(:availability,activity: activity )

      data = {}
      data[:id] = availability.id
      data[:currency] = "USD"
      data[:format] = "json"

      put :update, data
      expect(response.code).to eq("204")

      availability.reload
      expect(availability.currency).to eq("USD")

    end
  end

  describe "DELETE destroy" do
    it "deletes the availability" do
      activity = FactoryGirl.create(:activity)
      availability = FactoryGirl.create(:availability, activity: activity)

      data = {
        :format => "json",
        :id => availability.id
      }

      expect {
          delete :destroy, data
      }.to change(Availability, :count).by(-1)

      expect(response.status).to eq 204
    end
  end

end
