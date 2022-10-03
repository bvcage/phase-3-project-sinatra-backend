class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  ###########
  # RENTALS #
  ###########

  # read all rentals
  get "/rentals" do
    Rental.all.to_json
  end

  # create rental without data
  get "/rentals/new" do
    Rental.create().to_json
  end

  # read 1 rental
  get "/rentals/:id" do
    id = params[:id]
    Rental.find(id).to_json
  end

  # create rental with data
  post "/rentals" do
    info = JSON.parse(request.body.read)
    rental = Rental.create_or_find_by(info)
    if rental.checkout_date == nil then rental.update(checkout_date: Date.today) end
    if rental.due_date == nil then rental.update(due_date: Date.today + 14) end
    rental.to_json
  end
  
  # update rental
  patch "/rentals/:id/edit" do
    id = params[:id]
    rental = Rental.find(id)
    edits = JSON.parse(request.body.read)
    rental.update(edits)
    rental.to_json
  end

  # delete rental
  delete "/rentals/:id/delete" do
    { message: "delete rental" }.to_json
  end

end
