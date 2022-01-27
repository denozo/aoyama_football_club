class ContactsController < ApplicationController

  # before_action :authenticate_user!, except: [:new, :confirm, :complete, :create]

  def new
    @contact = Contact.new
  end

  def confirm
    p contact_params
    if contact_params.present?
      p "nil!!"
      @contact = Contact.new(contact_params)
    else
      p "new!!!!!"
      redirect_to confirm_contacts_path
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to complete_contacts_path, notice: 'お問い合わせ内容を送信しました'
    else
      render :new
    end
  end

  def complete
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end


end
