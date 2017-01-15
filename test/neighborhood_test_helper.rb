module NeighborhoodTestHelper

  def create_polygon
    points = self.geolocate
    boundary = Geokit::Polygon.new(points)
  end

  def geolocate
    coords = []
    self.coordinates.each do |coords|
      lat = coords[1]
      lng = coords[0]
      coords << Geokit::LatLng.new(lat, lng)
    end

    coords
  end
end
