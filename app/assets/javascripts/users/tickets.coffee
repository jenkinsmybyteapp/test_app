$ ->
  $('.new_ticket').on 'submit', (e) -> false
  $('#fileupload').fileupload
    dataType: 'script'
    replaceFileInput: false
    add: (e, form) ->
      $("form input[type='submit'").click -> form.submit()
