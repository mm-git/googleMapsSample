GoogleMapsLoader = require('google-maps')
Backbone = require('backbone')

class MapView extends Backbone.View
  el: "#map"

  initialize: (options) ->
    @google = null
    @map = null

  loadMap: ->
    new Promise((resolve, reject) =>
      #GoogleMapsLoader.KEY = 'your key';
      GoogleMapsLoader.LANGUAGE = 'ja';
      GoogleMapsLoader.LIBRARIES = ['geometry', 'places']


      GoogleMapsLoader.load((google) =>
        mapOpt =
          center                 : new google.maps.LatLng(35.1660, 136.0135)
          zoom                   : 12
        scrollwheel            : true
        disableDoubleClickZoom : true
        keyboardShortcuts      : true
        mapTypeId              : google.maps.MapTypeId.ROADMAP
        mapTypeControl         : true
        mapTypeControlOptions  :
          position : google.maps.ControlPosition.TOP_LEFT
        streetViewControl      : false
        scaleControl           : true
        scaleControlOptions:
          position : google.maps.ControlPosition.BOTTOM_RIGHT
        zoomControl           : true
        zoomControlOptions:
          position : google.maps.ControlPosition.TOP_LEFT

        @map = new google.maps.Map(@$el[0], mapOpt)
        @google = google

        OverlayView = require('./overlayView.coffee')
        @overlayView = new OverlayView(@map)

        resolve(@)
      )
    )

module.exports = MapView