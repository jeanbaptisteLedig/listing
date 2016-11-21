class Account::ContactsController < Account::AccountController
  def index
    @contacts = Contact.buyer_messages_from(current_user) 
  end
end
