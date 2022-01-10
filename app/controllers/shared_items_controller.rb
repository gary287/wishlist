class SharedItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: %i[purchase]

  # GET /lists/shared/1/items
  def index
    @items = @list.items
  end

  # PATCH/PUT /lists/shared/1/items/1
  def purchase
    @item.update({ purchased: true })
    redirect_to shared_items_path(@list.shared_id), notice: 'Item was successfully marked purchased.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find_by(shared_id: params[:shared_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:title, :url, :purchased, :list_id)
  end
end
