# Rules:
# IFF Full Height then Fixed vs. Adjust
# IFF Adjust then Crank vs Electric

# Desk Sample JSON
# desk =
#   id: 1,
#   adjustable: true,
#   electric: true,
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

default_desk =
  adjustable: false,
  computer_type: "none",
  converter: false,
  description: "No desks found! Try adjusting your search parameters",
  diy: false,
  title: "No desks found :(",
  price: "0",
  images:
    main: "./assets/question_mark.jpg",
    others: []

# Get Bootstrap Radio Button Checked Value
radio_val = (selector) ->
  for option in $(selector + " input")
    if option.checked
      return option.value
  return null

# Convert true/false strings to booleans
boolify = (str_bool) ->
  return str_bool == "true"

# Render Handlebars Templates
render_handlebars = (desks_to_show) ->
  # Default data if no matching desks
  handlebars_data =
    main_desk: default_desk,
    other_desks: []
  if desks_to_show.length > 0
    # Massage desk data into what template wants
    main_desk = desks_to_show[0]
    # TODO: Paginate other_desks in template
    other_desks = desks_to_show.slice 1
    handlebars_data =
      main_desk: main_desk,
      other_desks: other_desks
  desk_html = HandlebarsTemplates['desk_picker/display'](handlebars_data)
  $("#desk-display").html(desk_html)

show_desks = (desks) ->
  #console.log "SHOWING DESKS"
  #for desk in desks
  #  console.log desk.title
  render_handlebars(desks)


filter_desks = () ->
  desks_to_show = all_desks.desks # need .desks
  desks_to_show = filter_budget desks_to_show
  desks_to_show = filter_computer_type desks_to_show
  desks_to_show = filter_diy desks_to_show
  desks_to_show = filter_converter desks_to_show
  desks_to_show = filter_adjustable desks_to_show
  desks_to_show = filter_electric desks_to_show
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
  new_desks = []
  computer_type = radio_val "#computer-group"
  for desk in desks
    if desk.computer_type == "any" || desk.computer_type == computer_type
      new_desks.push desk
  return new_desks

###### TODO
###### CONVERT ALL THESE BOOLEAN FUNCTIONS TO REUSE CODE

filter_diy = (desks) ->
  new_desks = []
  diy = radio_val "#diy-group"
  for desk in desks
    if desk.diy == boolify(diy) # diy is string not bool
      new_desks.push desk
  return new_desks

filter_converter = (desks) ->
  new_desks = []
  converter = radio_val "#converter-group"
  for desk in desks
    if desk.converter == boolify(converter)
      new_desks.push desk
  return new_desks


filter_adjustable = (desks) ->
  new_desks = []
  adjustable = radio_val "#adjustable-group"
  for desk in desks
    if desk.adjustable == boolify(adjustable)
      new_desks.push desk
  return new_desks


filter_electric = (desks) ->
  new_desks = []
  electric = radio_val "#electric-group"
  for desk in desks
    if desk.electric == boolify(electric)
      new_desks.push desk
  return new_desks


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

# Setup initial Handlebars Templates
setup_handlebars = () ->
  Handlebars.registerHelper 'mksrc', (src_url) ->
    return "src=" + src_url

# Document Ready

ready = ->
  configure_slider()
  setup_handlebars()
  filter_desks()
  wire_up_events()

$(document).ready(ready)
$(document).on('page:load', ready)


