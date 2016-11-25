class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def handle_unverified_request
    forgery_protection_strategy.new(self).handle_unverified_request
  end

end
