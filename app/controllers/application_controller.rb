class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def allowed?(action:, user:)
  	
    if current_user.teacher? || current_user.client?
    flash[:error] = "Sorry. You are not allowed to perform this action."
    return redirect_to :back

  	end
  end

end
