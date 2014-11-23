# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

imdb_url = (id) -> "http://www.imdb.com/title/#{id}"
OMDB_API =
  url: 'http://omdbapi.com/'
  by_title: 't='
  by_id: 'i='
  options: [
    'plot=short'
    'r=json'
  ]
  sepratator: '&'

build_url = (query) ->
  OMDB_API.url + '?' + OMDB_API.options.concat( query )
    .join OMDB_API.sepratator

by_title_url = (title) -> build_url( OMDB_API.by_title + title )
by_id_url = (id) -> build_url( OMDB_API.by_id + id )

is_http_status_ok = (status) -> status == 200

get_info_with = (func, title) ->
  new Promise (resolve) ->
    $.get (func title), (data, status) ->
      return resolve data

get_info_by_id = (id) ->
  get_info_with by_id_url, id

get_info_by_title = (title) ->
  get_info_with by_title_url, title

update_movie_params = (get, movie_name) ->
  console.log "Getting for #{movie_name}"
  get(movie_name).done (json) ->
    movie = {}
    try
      movie = JSON.parse json
    catch
    if movie.Response == "True"
      $('#movie_suggestion').text(movie.Title).fadeIn() unless movie_name == movie.Title
      $('#movie_description').val movie.Plot
      $('#movie_link').val imdb_url movie.imdbID
      $('#movie_imdb_id').val movie.imdbID
      console.log "Setting for #movie_poster/#{movie.imdbID}"
      $("#movie_poster").attr('src', movie.Poster).on 'load', ->
        $(this).fadeIn()
      $("#movie_poster_#{movie.imdbID}").attr('src', movie.Poster).on 'load', ->
        $(this).fadeIn()
    else
      $('#movie_imdb_id').val ""
      $('#movie_suggestion').fadeOut()
      $('#movie_description').val ""
      $('#movie_link').val ""
      $("#movie_poster").fadeOut()

$(document).on 'page:change', ->
  $name = $('input#movie_name')
  name = $('#movie_name').val()
  update_movie_params get_info_by_title, name if name
  $('span#movie_id').each ->
    id = $(this).text()
    update_movie_params get_info_by_id, id if id
  $('#movie_suggestion').click ->
    $('#movie_name').val $(this).text()
    $(this).fadeOut()
  $name.bind 'input propertychange', _.debounce ( ->
    update_movie_params get_info_by_title, $name.val()
  ), 300
