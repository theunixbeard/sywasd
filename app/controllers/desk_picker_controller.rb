class DeskPickerController < ApplicationController
  def pick
    @desks = '{
  "desks": [
    {
      "id": 1,
      "title": "Desk Numero Uno",
      "description": "Its a laptop-only desk...",
      "computer_type": "laptop",
      "diy": false,
      "converter": true,
      "adjustable": false,
      "price": 500.50,
      "images": {
        "main": "./assets/standing_desk1.jpg",
        "others": [ 
          "./assets/sub_image1.jpg"
        ]
      }
    },
    {
      "id": 2,
      "title": "Desk Two Yo",
      "description": "Its a desktop-only desk...",
      "computer_type": "desktop",
      "diy": true,
      "converter": true,
      "adjustable": false,
      "price": 1120.00,
      "images": {
        "main": "./assets/standing_desk2.jpg",
        "others": [ 
          "./assets/sub_image1.jpg",
          "./assets/sub_image1.jpg"
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
      "electric": true,
      "price": 3.50,
      "images": {
        "main": "./assets/standing_desk3.jpg",
        "others": [
          "./assets/sub_image1.jpg",
          "./assets/sub_image1.jpg",
          "./assets/sub_image1.jpg"
        ]
      }
    }
  ]
}'
  end
end
