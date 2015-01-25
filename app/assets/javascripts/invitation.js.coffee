
$(document).on 'page:change', ->

  $a_link = $('#invitation-link')
  $hidden_link = $('#invitation-link-input')
  $textarea_link = $('#invitation-link-input textarea')

  $a_mail = $('#invitation-email')
  $hidden_mail = $('#invitation-email-input')
  $textarea_mail = $('#invitation-email-input textarea')
  $button_mail =$('#invitation-email-input button')
  $p_mail =$('#invitation-email-input p')

  $a_link.on 'click', (ev) ->
    ev.preventDefault()

    old_html = $a_link.html()
    $a_link.html('Please wait...')

    $hidden_mail.fadeOut()
    $.get $a_link.attr('href'), (resp) ->
      $a_link.html(old_html)
      $textarea_link.val(resp)
      $hidden_mail.fadeOut(always: ->
        $hidden_link.fadeIn()
      )

  $a_mail.on 'click', (ev) ->
    ev.preventDefault()
    $hidden_link.fadeOut(always: ->
      $hidden_mail.fadeIn()
    )

  $button_mail.on 'click', (ev) ->
    ev.preventDefault()
    email = $textarea_mail.val().trim()
    unless email.length is 0
      $.post $a_mail.attr('href'), { email: email }, ->
        $textarea_mail.val('')
        $p_mail.html("Sent to #{email}").fadeIn()
        setTimeout (-> $p_mail.fadeOut()), 2000
