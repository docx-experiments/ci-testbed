require 'rails_helper'

RSpec.describe "Lollipops", type: :request do
  describe "GET /lollipops" do
    it "works!" do
      get "/lollipops"
      expect(response).to have_http_status(200)
    end

    it "respond with list of lollipops" do 
      Lollipop.create(name: "Sweet", price: 300)
      Lollipop.create(name: "Sour", price: 400)

      get "/lollipops"
      expect(JSON.parse(response.body)).to include(
        include({ "name" => "Sweet", "price" => "300.0" }),
        include({ "name" => "Sour", "price" => "400.0" })
      )
    end
  end

  describe "POST /lollipops/:id/buy" do
    let(:lollipop) { Lollipop.create(name: "Sweet", price: 300) }

    it "works!" do
      post "/lollipops/#{lollipop.id}/buy"
      expect(response).to have_http_status(200)
    end

    it "returns 404 when not found" do
      post "/lollipops/no_chance/buy"
      expect(response).to have_http_status(404)
    end

    it "respond with list of lollipops" do 
      post "/lollipops/#{lollipop.id}/buy"
      expect(JSON.parse(response.body)).to include(
        "lollipop_id" => lollipop.id, "price" => "300.0", "created_at" => be_a(String)
      )
    end
  end
end
