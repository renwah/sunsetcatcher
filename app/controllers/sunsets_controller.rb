class SunsetsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create # Skip CSRF for API requests

  def index
    @sunsets = Sunset.all.order(created_at: :desc)
  end

  def create
    @sunset = Sunset.new(sunset_params)

    if params[:image].present?
      @sunset.image.attach(params[:image]) # Attach the uploaded image
    end

    if @sunset.save
      render json: { message: "Sunset created successfully", sunset: @sunset }, status: :created
    else
      render json: { errors: @sunset.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sunset_params
    params.permit(:timestamp, :image)
  end
end
