$(document).on "cocoon:after-insert", ->
  $('select.select2').select2(dropdownAutoWidth : true)

