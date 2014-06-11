require 'rails_helper'

RSpec.describe DeskPickerController, :type => :controller do

  describe "GET 'pick'" do
    it "returns http success" do
      get 'pick'
      expect(response).to be_success
    end
  end

end
