class LollipopsController < ApplicationController
  def index
    lollipops = Lollipop.all
    
    render json: lollipops
  end

  def buy
    lollipop = Lollipop.find(params[:id])

    purchase = lollipop.purchases.create(price: lollipop.price)
    render json: purchase
  rescue ActiveRecord::RecordNotFound
    render status: 404, json: { error: "Not Found" }
  end
end
