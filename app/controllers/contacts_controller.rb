class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:user_id])
  end
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @user = current_user
    if @contact.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @contact = Contact.find(params[:user_id])
  end

  def update
    @contact = Contact.find(params[:user_id])
    @contact.update(contact_params)
    redirect_to root_path
  end

  def destroy
    @contact = Contact.find(params[:user_id])
    @contact.destroy
    redirect_to root_path
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :mobile, :email, :user_id)
  end

end
