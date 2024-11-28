require 'swagger_helper'

RSpec.describe 'API::V1::Gps', type: :request do
  path '/api/v1/gps' do
    # Documentación para POST /api/v1/gps
    post 'Create a GPS waypoint' do
      tags 'GPS'
      consumes 'application/json'
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
          latitude: { type: :number, example: 20.23 },
          longitude: { type: :number, example: -0.56 },
          sent_at: { type: :string, format: :date_time, example: '2016-06-02T20:45:00Z' },
          vehicle_identifier: { type: :string, example: 'HA-3452' }
        },
        required: %w[latitude longitude sent_at vehicle_identifier]
      }

      response '201', 'Waypoint created successfully' do
        let(:payload) do
          {
            latitude: 20.23,
            longitude: -0.56,
            sent_at: '2016-06-02T20:45:00Z',
            vehicle_identifier: 'HA-3452'
          }
        end
        run_test!
      end

      response '422', 'Validation errors' do
        let(:payload) { {} }
        run_test!
      end
    end

    # Documentación para GET /api/v1/gps
    get 'List the latest GPS waypoints for all vehicles' do
      tags 'GPS'
      produces 'application/json'

      response '200', 'List of latest waypoints for all vehicles' do
        schema type: :array, items: {
          type: :object,
          properties: {
            vehicle_identifier: { type: :string, example: 'HA-3452' },
            latitude: { type: :number, example: 20.23 },
            longitude: { type: :number, example: -0.56 },
            timestamp: { type: :string, format: :date_time, example: '2016-06-02T20:45:00Z' }
          },
          required: %w[vehicle_identifier latitude longitude timestamp]
        }

        run_test!
      end
    end
  end
end
