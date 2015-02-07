
$(document).on 'page:change', ->

  $a_link = $('#invitation-link')
  $hidden_link = $('#invitation-link-input')
  $loading_link = $('#invitation-link-loading')
  $textarea_link = $('#invitation-link-input textarea')

  $a_mail = $('#invitation-email')
  $hidden_mail = $('#invitation-email-input')
  $loading_mail = $('#invitation-email-loading')
  $textarea_mail = $('#invitation-email-input textarea')
  $button_mail =$('#invitation-email-input button')
  $p_mail =$('#invitation-email-input p')

  $a_link.on 'click', (ev) ->
    ev.preventDefault()
    $hidden_mail.fadeOut(0)
    $loading_link.show(0)

    $.get $a_link.attr('href'), (resp) ->
      $textarea_link.val(resp)
      $loading_link.hide(0)
      $hidden_link.fadeIn()

  $a_mail.on 'click', (ev) ->
    ev.preventDefault()
    $hidden_link.fadeOut(always: ->
      $hidden_mail.fadeIn()
    )

  $button_mail.on 'click', (ev) ->
    ev.preventDefault()
    email = $textarea_mail.val().trim()
    unless email.length is 0
      $loading_mail.show(0)
      $.post $a_mail.attr('href'), { email: email }, ->
        $loading_mail.hide(0)
        $textarea_mail.val('')
        $p_mail.html("Sent to #{email}").fadeIn()
        setTimeout (-> $p_mail.fadeOut()), 2000
