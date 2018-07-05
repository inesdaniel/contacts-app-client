class Client::ContactsController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/contacts")
    @contacts = response.body
    render "index.html.erb"
  end
  def show
    contact_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    render "show.html.erb"
  end
end
