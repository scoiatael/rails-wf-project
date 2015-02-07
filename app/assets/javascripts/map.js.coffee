
ready = ->
  return unless google and google.maps
  iiLatLng = new google.maps.LatLng(51.110898149199606, 17.05341249704361)
  mapOptions = {
    zoom: 15,
    center: iiLatLng
  }

  map_mount_point = document.getElementById('map-canvas')
  return unless map_mount_point

  map = new google.maps.Map(map_mount_point,
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
