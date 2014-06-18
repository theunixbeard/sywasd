class DeskPickerController < ApplicationController
  def pick
    @desks = '{
  "desks": [
    {
      "id": 1,
      "title": "Desk Numero Uno",
      "description": "Its a desk...",
      "computer_type": "any",
      "diy": false,
      "converter": true,
      "adjustable": false,
      "price": 500.50,
      "images": {
        "main": "",
        "others": [ ""
        ]
      }
    },
    {
      "id": 2,
      "title": "Desk Two Yo",
      "description": "Its a desk...",
      "computer_type": "any",
      "diy": true,
      "converter": true,
      "adjustable": false,
      "price": 1120.00,
      "images": {
        "main": "",
        "others": [ ""
        ]
      }
    },
    {
      "id": 3,
      "title": "Desk TreeFiddy",
      "description": "Its a desk...",
      "computer_type": "any",
      "diy": false,
      "converter": false,
      "adjustable": true,
      "adjustable_power": "electric",
      "price": 3.50,
      "images": {
        "main": "",
        "others": [ ""
        ]
      }
    }
  ]
}'
  end
end
