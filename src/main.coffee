global.jQuery = require('jquery')
require('bootstrap')

MapView = require('./map/view/MapView')

mapView = new MapView()

mapView.loadMap()
.then(
  ->
    alert("google map initialized !")
)