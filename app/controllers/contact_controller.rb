class ContactController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end
  
  def new
    @contact = Contact.new
  end

  def create
   @contact = Contact.new(contact_params)
    if @contact.valid?
     @contact.save
     redirect_to contacts_path
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to contact_path
  end

  def destroy
    Contact.destroy(params[:id])
    redirect_to contacts_path
  end

  def contact_params
    params.require(:contact).permit(:title)
  end

end
