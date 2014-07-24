$(document).on 'click', '.modal .modal-form-submit', ->
  jQuery(@).parents('.modal').find('form').submit()
  jQuery(@).parents('.modal').find('form').attr('disabled', 'disabled')
