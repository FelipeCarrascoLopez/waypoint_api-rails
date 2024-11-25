class ProcessWaypointJob
  include Sidekiq::Job

  def perform(waypoint_id)
    waypoint = Waypoint.find(waypoint_id)

    puts "Procesando Waypoint ID: #{waypoint.id}"
    puts "Latitud: #{waypoint.latitude}, Longitud: #{waypoint.longitude}"
  end
end
