class Account::MessagesController < Account::AccountController

  def index
    @messages = Contact.seller_contacts_for(current_user) 
  end
end
