# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  pusher = new Pusher('41d4ff4435428bdfddaf')
  channel = pusher.subscribe('snap')
  
  source   = $("#snap-template").html()
  template = Handlebars.compile(source)

  channel.bind('upload', (data)->  
    $('#main').prepend(template(data))
  )