class ItemsController < ApplicationController
  def index
  end








  private

  def product_informations_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
