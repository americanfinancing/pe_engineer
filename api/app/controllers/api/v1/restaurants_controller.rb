module Api::V1
  class RestaurantsController < ApplicationController
    def index
      @restaurants = []

      render json: @restaurants
    end
  end
end
