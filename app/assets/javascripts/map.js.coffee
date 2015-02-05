
ready = ->
  iiLatLng = new google.maps.LatLng(51.110898149199606, 17.05341249704361)
  mapOptions = {
    zoom: 15,
    center: iiLatLng
  }

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions)


  marker = new google.maps.Marker
    position: iiLatLng
    map: map,
    title: 'Join us here!'

  infoWindow = new google.maps.InfoWindow
    content: 'Join us here!'

  infoWindow.open map, marker

$(document).on 'page:load', ready
$ ready
