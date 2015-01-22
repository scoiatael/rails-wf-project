# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

ready = ->
  penultimate = (arr) ->
    arr[arr.length - 2]

  $('.vote').on 'click', (ev) ->
    ev.preventDefault()
    href = $(this).context.href
    id = penultimate href.split('/')
    console.log "Click on", href
    $.post href, "", (resp) ->
      $("#vote_option#{id}").html resp
      console.log href, " resp ", resp, " id ", id

  $('.vote_header').on 'click', ->
    id = $(this).context.id
    klass = ".table#{id}"
    unless $(klass).is ":visible"
      $('.vote_table').fadeOut
        done: ->
          setTimeout ( -> $(klass).fadeIn()), 400

  $('.vote_table').first().addClass('first').fadeIn()

$(document).on 'page:load', ready
$ ready
