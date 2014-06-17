class DeskPickerController < ApplicationController
  def pick
    @desks = '{
  "desks": [
    {
      "title": "Desk Numero Uno",
      "description": "Its a desk...",
      "computer_type": "any",
      "diy": false,
      "converter": true,
      "adjustable": false,
      "price": 500.50
    },
    {
      "title": "Desk Two Yo",
      "description": "Its a desk...",
      "computer_type": "any",
      "diy": true,
      "converter": true,
      "adjustable": false,
      "price": 1120.00
    },
    {
      "title": "Desk TreeFiddy",
      "description": "Its a desk...",
      "computer_type": "any",
      "diy": false,
      "converter": false,
      "adjustable": true,
      "adjustable_power": "electric",
      "price": 3.50
    }
  ]
}'
  end
end
