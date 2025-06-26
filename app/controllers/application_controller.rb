class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  add_flash_types :success, :danger

  private

  def redirect_if_logged_in
    if logged_in?
      redirect_to root_path, success: t("flash_message.logged_in")
    end
  end

  def not_authenticated
    redirect_to login_path
  end
end
