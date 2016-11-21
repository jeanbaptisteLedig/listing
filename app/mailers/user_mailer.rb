class UserMailer < ApplicationMailer

  def new_contact(listing_id, email, message)
    @listing = Listing.find(listing_id)
    @client_email = email
    @message = message

    mail(to: @listing.user.email, subject: 'Réponse à votre annonce:')
  end
end
