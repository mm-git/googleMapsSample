MapView = require('./map/view/MapView')

mapView = new MapView()
mapView.loadMap()
.then(
  ->
    alert("google map initialized !")
)
