class Account::AccountController < ApplicationController
  protect_from_forgery with: :exception
  layout 'account'
  before_action :authenticate_user!
end
