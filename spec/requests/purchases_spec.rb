require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  describe "GET /purchases" do
    it "works!" do
      get '/purchases'
      expect(response).to have_http_status(200)
    end

    it "renders purchases" do
      lollipop = Lollipop.create(name: "Sweet", price: 500)
      purchase = Purchase.create(lollipop_id: lollipop.id, price: 400)

      get '/purchases'
      expect(JSON.parse(response.body)).to include(
        include("lollipop_id" => lollipop.id, "price" => "400.0")
      )
    end
  end
end
