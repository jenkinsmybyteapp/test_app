$(document).on 'click', '.modal .modal-form-submit', ->
  $(@).parents('.modal').find('form').submit()
  $(@).parents('.modal').find('form').attr('disabled', 'disabled')
