class Public::ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  # 入力内容に誤りがあった場合、入力内容を保持したまま前のページに戻る
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :phone_number, :subject, :message)
  end
end
