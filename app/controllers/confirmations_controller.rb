class ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    render file: "#{Rails.root}/public/confirm_success.html", layout: false, status: 200
  end
end
