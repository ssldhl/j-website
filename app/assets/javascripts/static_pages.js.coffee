# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

###
# require plugins/jquery-countdown/jquery.countdown.min.js
# require countdown.js

  $(document).ready ->
  options = {
    dataType:  'json',
    beforeSubmit: ->
        $.blockUI()
    success:(response) ->
      $.unblockUI()
      if response.status == "error"
        $(".modal-body p").html(response.error)
      else
        $(".modal-body p").html("Thank you for your subscription!")
      $('#newsletterModal').modal('show')
    error: ->
      $.unblockUI()
      alert "An error has occured. Please try again later!"
  }
  $('#countdownForm').ajaxForm(options)###
