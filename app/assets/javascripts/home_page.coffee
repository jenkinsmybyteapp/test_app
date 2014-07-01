# Simple way to prevent robots from spamming
# It's very primitive and you should use somethng more serious in production
# For futher details see https://github.com/subwindow/negative-captcha

$ ->
  $('.issue-form form').submit ->
    return false unless $(@).find('input#honeypot').val() is ''
