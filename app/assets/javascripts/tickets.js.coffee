# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Reload the view when a ticket is created successfully. 
$(document).on 'ajax:success', '#ticket-modal', (xhr, data, status) ->
  location.reload()

# Show error messages otherwise.
$(document).on 'ajax:error', '#ticket-modal', (xhr, data, status) ->
  form = $(this).find('.modal-body')
  div = $('<div id="ticket-modal-errors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')

  data.responseJSON.messages.forEach (message, i) ->
    li = $('<li></li>').text(message)
    ul.append(li)

  if $('#ticket-modal-errors')[0]
    $('#ticket-modal-errors').html(ul)
  else
    div.append(ul)
    form.prepend(div)

