# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

addNewOption = ->
  $thisOption = $ '#blank-vote-option'
  $this = $ this
  $addNewOptionDiv = $thisOption.clone()
    .appendTo('#vote-options')
  $addNewOptionDiv.children('button').on 'click', addNewOption
  $this.off 'click'
  $thisOption.removeAttr('id').children('button').html('-').on 'click', ->
    $thisOption.remove()
  return false

$(document).on 'page:change', ->
  $('button#add-vote-option')
    .on('click', addNewOption)
    .addClass('green')
