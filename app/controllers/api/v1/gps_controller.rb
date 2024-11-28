module Api
  module V1
    class GpsController < ApplicationController
      def index
        vehicles_with_latest_waypoints = Vehicle.includes(:waypoints).map do |vehicle|
          latest_waypoint = vehicle.waypoints.order(timestamp: :desc).first
          next unless latest_waypoint

          {
            vehicle_identifier: vehicle.identifier,
            latitude: latest_waypoint.latitude,
            longitude: latest_waypoint.longitude,
            timestamp: latest_waypoint.timestamp
          }
        end.compact

        render json: vehicles_with_latest_waypoints, status: :ok
      end

      def create
        vehicle = Vehicle.find_or_create_by(identifier: params[:vehicle_identifier])
        waypoint = vehicle.waypoints.new(
          latitude: params[:latitude],
          longitude: params[:longitude],
          timestamp: resolve_sent_at
        )

        if waypoint.save
          ProcessWaypointJob.perform_async(waypoint.id)
          render json: { message: 'Waypoint created successfully' }, status: :created
        else
          render json: { errors: waypoint.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def resolve_sent_at
        params[:sent_at].presence || Time.now.utc
      end
    end
  end
end
