class Api::OrdersController < Api::BaseController

  before_action :set_user

  def index
    @orders = @user.orders
                # .joins(:user).joins(:user_address).joins(product: :region)
    render_jsonapi_response(@orders)
  end

  def create
    @order = @user.orders.build(order_params)
    @order.save
    render_jsonapi_response(@order)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def order_params
    params.require(:order).permit(:user_id, :user_address_id, :receiver_name, :receiver_lastname,
                                  :shipping_cost, :grand_total,
                                  order_items_attributes: [:product_id, :amount, :grand_total])
  end
end
