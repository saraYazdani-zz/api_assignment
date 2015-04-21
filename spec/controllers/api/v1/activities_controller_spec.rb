require 'rails_helper'

describe Api::V1::ActivitiesController, :type => :controller do

  describe "GET 'index'" do
    it " returns all the activities " do
      data = FactoryGirl.create(:activity)
      data = {
        :format => "json"
      }
      get :index, data
      expect(response.status).to eq 200
      expect(ActiveSupport::JSON.decode(response.body).count).to eq 1
    end
  end

  describe "GET show" do

    it "Shows the activity" do
      activity = FactoryGirl.create(:activity)
      data = {
        :format => "json",
        :id => activity.id
      }
      get :show, data
      expect(response.status).to eq 200
      hash = ActiveSupport::JSON.decode(response.body)
      expect(hash[:id] == activity.id)
      expect(hash[:title] == activity.title)
      expect(hash[:description] == activity.description)

    end

  end

  describe "POST create" do
    it "creates a new activity" do
      data = FactoryGirl.build(:activity).attributes.except("id", "created_at", "updated_at")
      data[:format] = "json"

      expect {
        post :create, data
      }.to change(Activity, :count).by(1)

      expect(response.status).to eq 201

    end
  end

  describe "PUT update" do
    it "updates the activity description" do
      description1 = "Sara is the best"
      activity = FactoryGirl.create(:activity, description: description1)

      data = {}
      data[:id] = activity.id
      data[:description] = description1
      data[:format] = "json"

      put :update, data
      expect(response.code).to eq("204")

      activity.reload
      expect(activity.description).to eq(description1)

    end
  end

  describe "DELETE destroy" do
    it "deletes the activity" do
      activity = FactoryGirl.create(:activity)
      data = {
        :format => "json",
        :id => activity.id
      }

      expect {
          delete :destroy, data
      }.to change(Activity, :count).by(-1)

      expect(response.status).to eq 204
    end
  end

end
