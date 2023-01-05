class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes

    get '/bakeries' do
      bakeries = Bakery.all
      bakeries.to_json
    end

    get '/bakeries/:id' do
      bakery = Bakery.find_by(params[:id])
      
      bakery.to_json
      # bakery.to_json(include :baked_goods)
      bakery.to_json(include: :baked_goods)
    end

    get '/baked_goods/by_price' do
      price = BakedGood.all.order(price: :desc)
      price.to_json
    end

    get '/baked_goods/most_expensive' do
      price = BakedGood.all.order(price: :desc).first
      price.to_json
    end



end
