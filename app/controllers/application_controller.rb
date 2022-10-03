class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  #############
  # CUSTOMERS #
  #############

  get "/customers" do
    Customer.all.to_json
  end

  get "/customers/:id" do
    id = params[:id]
    Customer.find(id).to_json
  end

  patch "/customers/:id/edit" do
    { message: "edit customer" }.to_json
  end

  delete "/customers/:id/delete" do
    { message: "delete customer" }.to_json
  end

  ##########
  # MOVIES #
  ##########

  get "/movies" do
    Movie.all.to_json
  end

  get "/movies/:id" do
    id = params[:id]
    Movie.find(id).to_json
  end

  ###########
  # RENTALS #
  ###########

  # read all rentals
  get "/rentals" do
    Rental.all.to_json
  end

  # read 1 rental
  get "/rentals/:id" do
    id = params[:id]
    Rental.find(id).to_json
  end

  # create rental without data
  get "/rentals/new" do
    { message: "make new rental without data" }.to_json
  end

  # create rental with data
  post "/rentals" do
    { message: "make new rental with data" }.to_json
  end
  
  # update rental
  patch "/rentals/:id/edit" do
    { message: "edit rental" }.to_json
  end

  # delete rental
  delete "/rentals/:id/delete" do
    { message: "delete rental" }.to_json
  end

end
