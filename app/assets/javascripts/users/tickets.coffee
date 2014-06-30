$ ->
  $('#fileupload').fileupload
    dataType: 'script'
    replaceFileInput: false
    add: (e, form) ->
      $('.new_ticket').on 'submit', (e) -> false
      $("form input[type='submit'").click -> form.submit()
