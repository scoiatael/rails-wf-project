# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$ ->
  last = (arr) ->
    arr[arr.length - 1]

  $('.upvote').on 'click', (ev) ->
    ev.preventDefault()
    href = $(this).context.href
    id = last href.split('/')
    console.log "Upvote on", href
    $.post href, "", (resp) ->
      $("#vote_option#{id}").html resp

  $('.downvote').on 'click', (ev) ->
    ev.preventDefault()
    href = $(this).context.href
    id = last href.split('/')
    console.log "Downvote on", href
    $.ajax
      type: 'DELETE'
      url: href
      success: (resp) ->
        $("#vote_option#{id}").html resp

  $('.vote_header').on 'click', ->
    id = $(this).context.id
    klass = ".table#{id}"
    unless $(klass).is ":visible"
      $('.vote_table').fadeOut
        done: ->
          setTimeout ( -> $(klass).fadeIn()), 400

  ready = ->
    $('.vote_table').first().addClass('first').fadeIn()
  $(document).on 'page:load', ready
  ready()
