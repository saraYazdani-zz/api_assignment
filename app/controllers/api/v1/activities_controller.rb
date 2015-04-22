module Api
  module V1
    class ActivitiesController < ApplicationController
      respond_to :json

      def index
        @activities = Activity.all
        #Rails.log.info "Number of activities: #{@activities.count}"
        respond_with @activities
      end

      def show
        @activity = Activity.find(params[:id])
        respond_with @activity
      end

      def create
        @activity = Activity.new(get_secure_params)
        @activity.save
        respond_with @activity, :location => polymorphic_url([:api, :v1, @activity])
      end

      def update
        @activity = Activity.find(params[:id])
        @activity.update(get_secure_params)
        respond_with @activity
      end

      def destroy
        @activity = Activity.find(params[:id])
        @activity.destroy
        respond_with @activity
      end

      private
        def get_secure_params
          params.permit(:title, :description, :price, :currency, :city, :country, :is_active)
        end
    end
  end
end
