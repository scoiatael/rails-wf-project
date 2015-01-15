# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  last = (arr) ->
    arr[arr.length - 1]

  $('.upvote').on 'click', (ev) ->
    ev.preventDefault()
    href = $(this).context.href
    id = last href.split('/')
    console.log "Upvote on", href
    $.post href, "", (resp) ->
      console.log resp, id
      $("##{id}").html resp

  $('.downvote').on 'click', (ev) ->
    ev.preventDefault()
    href = $(this).context.href
    id = last href.split('/')
    console.log "Downvote on", href
    $.ajax
      type: 'DELETE'
      url: href
      success: (resp) ->
        console.log resp, id
        $("##{id}").html resp
