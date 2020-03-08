Rails.application.routes.draw do
  get 'purchases', to: 'purchases#index'
  get 'lollipops', to: 'lollipops#index'
  post 'lollipops/:id/buy', to: 'lollipops#buy'
end
