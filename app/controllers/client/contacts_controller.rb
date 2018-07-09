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
        input_first_name: params[:input_first_name],
        input_last_name: params[:input_last_name],
        input_email: params[:input_email],
        input_phone_number: params[:input_phone_number]
      }
    )
    @contact = response.body
    flash[:succes] = "You made a new contact!"
    redirect_to "/client/contacts"
  end
  def edit
    contact_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    flash[:succes] = "You edited a contact!"
    render "edit.html.erb"
  end
  def update
    client_params = {
        input_first_name: params[:input_first_name],
        input_last_name: params[:input_last_name],
        input_email: params[:input_email],
        input_phone_number: params[:input_phone_number]
      } 
    response = Unirest.patch("http://localhost:3000/api/contacts/#{params[:id]}", parameters: client_params)
    @contact = response.body
    redirect_to "/client/contacts/#{@contact["id"]}"
  end
  def destroy
    contact_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/contacts/#{contact_id}")
    redirect_to "/client/contacts"

  end
end
