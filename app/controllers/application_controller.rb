class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'application'
  I18n.locale = :en

end
