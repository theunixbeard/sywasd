# How to make form actually submit!
# http://stackoverflow.com/questions/11462434/twitter-bootstrap-radio-buttons-not-working

# Rules:
# IFF Full Height then Fixed vs. Adjust
# IFF Adjust then Crank vs Electric


# Desk Sample JSON
# desk =
#   adjustable: true,
#   adjustable_power: "electric",
#   computer_type: "any",
#   converter: false,
#   description: "Its a desk...",
#   diy: false,
#   title: "Desk TreeFiddy"
#   price: 449.50

filter_desks = () ->
  desks_to_show = all_desks
  console.log "Starting Desks: "
  console.log desks_to_show
  filter_budget desks_to_show
  filter_computer_type desks_to_show
  filter_diy desks_to_show
  filter_converter desks_to_show
  filter_adjustable desks_to_show
  filter_adjustable_power desks_to_show
  rank_desks desks_to_show
  console.log "Remaining Desks: "
  console.log desks_to_show

# UI Filter functions

filter_budget = (desks) ->
  
filter_computer_type = (desks) ->
  
filter_diy = (desks) ->

filter_converter = (desks) ->

filter_adjustable = (desks) ->

filter_adjustable_power = (desks) ->

rank_desks = (desks) ->

# Configure Bootstrap Slider
configure_slider = () ->
  slider_options = {tooltip: 'always'}
  $("#ex8").slider(slider_options)

# Document Ready

ready = ->
  configure_slider()
  filter_desks()

$(document).ready(ready)
$(document).on('page:load', ready)


