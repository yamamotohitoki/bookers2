class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end
end
