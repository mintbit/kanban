class ListsController < ApplicationController
  before_action :set_list

  def create
    @list = List.new(list_params)

    if @list.save
      # create.turbo_stream.slim
    else
      redirect_to root_path
    end
  end

  def update
    if @list.update(list_params)
      head :ok
    else
      redirect_to root_path
    end
  end

  def destroy
    @list.destroy
    head :ok
  end

  private
    def set_list
      @list = List.find(params[:id]) if params[:id]
    end

    def list_params
      params.require(:list).permit(:board_id, :title, :position)
    end
end
