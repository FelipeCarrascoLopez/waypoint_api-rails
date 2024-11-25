module Api
    module V1
      class GpsController < ApplicationController
        def create
          # Encuentra o crea el vehículo
          vehicle = Vehicle.find_or_create_by(identifier: params[:vehicle_identifier])
  
          # Crea el waypoint asociado al vehículo
          waypoint = vehicle.waypoints.new(
            latitude: params[:latitude],
            longitude: params[:longitude],
            timestamp: params[:sent_at]
          )
  
          if waypoint.save
            render json: { message: 'Waypoint created successfully' }, status: :created
          else
            render json: { errors: waypoint.errors.full_messages }, status: :unprocessable_entity
          end
        end
      end
    end
  end
  