class RentalsController < ApplicationController

   # read all rentals
   get "/rentals" do
      rentals = Rental.all
      { data: rentals, status: 200 }.to_json
   end

   # create rental without data
   get "/rentals/new" do
      rental = Rental.create()
      { data: rental, status: 201 }.to_json
   end

   # read 1 rental
   get "/rentals/:id" do
      id = params[:id]
      rental = Rental.find(id)
      { data: rental, status: 200 }.to_json
   end

   # create rental with data
   post "/rentals" do
      info = JSON.parse(request.body.read)
      rental = Rental.create_or_find_by(info)
      if rental.checkout_date == nil then rental.update(checkout_date: Date.today) end
      if rental.due_date == nil then rental.update(due_date: Date.today + 14) end
      { data: rental, status: 201 }.to_json
   end

   # update rental
   patch "/rentals/:id/edit" do
      id = params[:id]
      rental = Rental.find(id)
      edits = JSON.parse(request.body.read)
      rental.update(edits)
      { data: rental, status: 202 }.to_json
   end

   # delete rental
   delete "/rentals/:id/delete" do
      id = params[:id]
      Rental.find(id).destroy
      { data: nil, status: 204 }.to_json
   end

end