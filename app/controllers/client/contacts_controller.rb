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
  def new
    render "new.html.erb"
  end
  def create
    response = Unirest.post("http://localhost:3000/api/contacts",
      parameters: {
        first_name: params[:input_first_name],
        last_name: params[:input_last_name],
        email: params[:input_email],
        phone_number: params[:input_phone_number]
      }
    )
    @contact = response.body
    render "show.html.erb"
  end
end
