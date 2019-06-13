# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'mouseout', '#conversation-main', (event) =>
	conversation_id = $("#conversation-main").data("conversation")
	App.read.update(conversation_id)




