class Api::AddressesController < Api::BaseController

  before_action :set_user

  def index
    @user_addresses = @user.user_addresses
    render_jsonapi_response(@user_addresses)
  end

  def create
    @user_address = @user.user_addresses.build(user_addresses_params)
    @user_address.save
    @user.user_addresses.where.not(id: @user_address.id).update(main_address: false) if @user.user_addresses.size > 1
    render_jsonapi_response(@user_address)
  end

  def update
    @user_address = @user.user_addresses.find(params[:id])
    @user_address.assign_attributes(user_addresses_params)
    @user.user_addresses.where.not(id: @user_address.id).update(main_address: false) if @user_address.main_address_was == false && @user_address.main_address_changed?
    @user_address.save
    render_jsonapi_response(@user_address)
  end

  def destroy
    @user_address = @user.user_addresses.find(params[:id])
    @user_address.destroy
    render_jsonapi_response(@user_address)
  end

  private

  def user_addresses_params
    params.require(:user_address).permit(:address_1, :address_2, :telephone, :country, :province, :zip_code, :main_address)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
