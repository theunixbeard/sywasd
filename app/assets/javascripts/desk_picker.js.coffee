# How to make form actually submit!
# http://stackoverflow.com/questions/11462434/twitter-bootstrap-radio-buttons-not-working

# Rules:
# IFF Full Height then Fixed vs. Adjust
# IFF Adjust then Crank vs Electric

# Desk Sample JSON
# desk =
#   id: 1,
#   adjustable: true,
#   adjustable_power: "electric",
#   computer_type: "any",
#   converter: false,
#   description: "Its a desk...",
#   diy: false,
#   title: "Desk TreeFiddy",
#   price: 449.50,
#   images: {
#     main: "http://s3.com/main/image/url/here.png",
#     others: [
#       "http://s3.com/others/1.png",
#       "http://s3.com/others/2.png"
#     ]
#   }

show_desks = (desks) ->
  console.log "SHOWING DESKS"
  for desk in desks
    console.log desk.title

filter_desks = () ->
  desks_to_show = all_desks.desks # need .desks
  desks_to_show = filter_budget desks_to_show
  desks_to_show = filter_computer_type desks_to_show
  desks_to_show = filter_diy desks_to_show
  desks_to_show = filter_converter desks_to_show
  desks_to_show = filter_adjustable desks_to_show
  desks_to_show = filter_adjustable_power desks_to_show
  desks_to_show = rank_desks desks_to_show
  show_desks desks_to_show

# UI Filter functions

filter_budget = (desks) ->
  new_desks = []
  budget = $("#budget-slider").slider('getValue')
  budget_min = budget[0]
  budget_max = budget[1]
  for desk in desks
    if desk.price >= budget_min && desk.price <= budget_max
      new_desks.push desk
  return new_desks

filter_computer_type = (desks) ->
  return desks

filter_diy = (desks) ->
  return desks

filter_converter = (desks) ->
  return desks

filter_adjustable = (desks) ->
  return desks

filter_adjustable_power = (desks) ->
  return desks

rank_desks = (desks) ->
  return desks

# Wire up Events
wire_up_events = () ->
  $("#search-form :input").change () ->
    filter_desks()
  # Special event for slider
  $("#budget-slider").on 'slideStop', () ->
    filter_desks()

# Configure Bootstrap Slider
configure_slider = () ->
  slider_options = {tooltip: 'always'}
  $("#budget-slider").slider(slider_options)

# Document Ready

ready = ->
  configure_slider()
  filter_desks()
  wire_up_events()

$(document).ready(ready)
$(document).on('page:load', ready)


