# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  $('button#add-vote-option').on('click', ->
    blank = $('#blank-vote-option').clone().appendTo('#vote-options')
    blank.removeAttr('id').children('button').html('-').on 'click', ->
      blank.remove()
    return false
  ).addClass 'green'
