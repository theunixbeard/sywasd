# How to make form actually submit!
# http://stackoverflow.com/questions/11462434/twitter-bootstrap-radio-buttons-not-working

# Rules:
# IFF Full Height then Fixed vs. Adjust
# IFF Adjust then Crank vs Electric

ready = ->
  slider_options = {tooltip: 'always'}
  $("#ex8").slider(slider_options)

$(document).ready(ready)
$(document).on('page:load', ready)
