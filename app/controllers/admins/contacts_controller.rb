class Admins::ContactsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @contacts = Contact.page(params[:page]).per(10)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      redirect_to admins_contact_path(@contact), notice: "更新しました"
    else
      render :edit
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:answer_status)
  end

end
