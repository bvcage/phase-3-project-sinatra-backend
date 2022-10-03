class CustomersController < ApplicationController

   get "/customers" do
      Customer.all.to_json
   end

   get "/customers/new" do
      Customer.create().to_json
   end

   get "/customers/:id" do
      id = params[:id]
      Customer.find(id).to_json
   end

   patch "/customers/:id/edit" do
      id = params[:id]
      customer = Customer.find(id)
      edits = JSON.parse(request.body.read)
      customer.update(edits)
      customer.to_json
   end

   post "/customers" do
      info = JSON.parse(request.body.read)
      customer = Customer.create_or_find_by(info)
      customer.to_json
   end

   delete "/customers/:id/delete" do
      { message: "delete customer" }.to_json
   end
   
end