class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: %i[edit update destroy]

  # GET /items or /items.json
  def index
    @items = @list.items
  end

  # GET /items/new
  def new
    @item = @list.items.build
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @item = @list.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_items_path(@list), notice: 'Item was successfully created.' }
        format.json { render partial: 'items/index.json', status: :created, location: list_items_path(@list) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to list_items_path(@list), notice: 'Item was successfully updated.' }
        format.json { render partial: 'items/index.json', status: :ok, location: list_items_path(@list) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to list_items_path(@list), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:title, :url, :purchased, :list_id)
  end
end
