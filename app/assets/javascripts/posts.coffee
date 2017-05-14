$(document).ready ->
  $('.new_post').hide()
  $('body').on 'click', '#add_post', ->
    $('.new_post').slideDown()
    false

jQuery ->
  $('.best_in_place').best_in_place()
