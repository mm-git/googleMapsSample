class OverlayView extends google.maps.OverlayView
  constructor: (map) ->
    if !OverlayView.instance
      @setMap(map)
      OverlayView.instance = @

    return OverlayView.instance

  draw: ->
    #do nothing

  remove: ->
    #do nothing

  fromContainerPixelToLatLng: (point) ->
    return @getProjection().fromContainerPixelToLatLng(point)

  fromDivPixelToLatLng: (point) ->
    return @getProjection().fromDivPixelToLatLng(point)

  fromLatLngToContainerPixel: (point) ->
    return @getProjection().fromLatLngToContainerPixel(point)

  fromLatLngToDivPixel: (point) ->
    return @getProjection().fromLatLngToDivPixel(point)

module.exports = OverlayView
