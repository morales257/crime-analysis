$(document).ready(function() {
  mapboxgl.accessToken = 'pk.eyJ1IjoibW9yYWxlczI1NyIsImEiOiJjaWpybXdsMWMwY2tndG9tNXB5ajFhbjE3In0.whDnBZvQN5wQ5bwvtw2fBw';

//  var bounds = [[-79.6,43.6],[-79.1,43.9]];
//  var llb = mapboxgl.LngLatBounds.convert(bounds);
  var map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/morales257/cijrn5hcy006o90lxl34qtpho',
      center: [-79.392524,43.654967],
      zoom: 9
  });

  map.on('load', function(){
    //map.fitbounds ([[-79.6,43.6],[-79.1,43.9]]);

    var layers = ['less_than_10', 'less_than_20', 'less_than_50',
    'less_than_100', 'less_than_150', 'less_than_200', 'less_than_250']

    map.on('mousemove', function(e) {
      var neighborhoods = map.queryRenderedFeatures(e.point, {
        layers: layers
      });

      if (neighborhoods.length > 0) {
        document.getElementById('crime').innerHTML = '<h3><strong>' +
        neighborhoods[0].properties.name + '</strong></h3><p><strong><em>' +
        neighborhoods[0].properties.crime + '</strong> crimes in this area</em></p>';
      } else{
        document.getElementById('crime').innerHTML = '<p>Hover over a neighborhood!</p>';
      }
    });
  });
});
