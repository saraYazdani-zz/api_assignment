module Api
  module V1
    class AvailabilitiesController < ApplicationController
      respond_to :json

      def index
         @availabilities = Availability.includes(:activity)
         @availabilities.all
         respond_with @availabilities
      end


      def show
        @availability = Availability.find(params[:id])
        respond_with @availability
      end

      def create
        @availability = Availability.new(get_secure_params_forcreate)
        @availability.save!
        respond_with @availability, :location => polymorphic_url([:api, :v1, @availability])

      end

      def update

        @availability = Availability.find(params[:id])
        @availability.update!(get_secure_params_forcreate)
        respond_with @availability

      end

      def destroy
        @availability = Availability.find(params[:id])
        @availability.destroy
        respond_with @availability
      end

      private
        def get_secure_params_forcreate
          params.permit(:activity_id, :starts_at, :price, :currency)
        end
    end
  end
end
