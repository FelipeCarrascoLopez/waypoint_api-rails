module Api
    module V1
      class GpsController < ApplicationController
        def create
          vehicle = Vehicle.find_or_create_by(identifier: params[:vehicle_identifier])
          waypoint = vehicle.waypoints.new(
            latitude: params[:latitude],
            longitude: params[:longitude],
            timestamp: params[:sent_at],
          )
          if waypoint.save
            ProcessWaypointJob.perform_async(waypoint.id)
            render json: { message: 'Waypoint created successfully' }, status: :created
          else
            render json: { errors: waypoint.errors.full_messages }, status: :unprocessable_entity
          end
        end
      end
    end
  end
  