class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  I18n.locale = :en

end
