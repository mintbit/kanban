class CardsController < ApplicationController
  before_action :set_card

  def show
  end

  def create
    @card = Card.new(card_params)
    redirect_to root_path unless @card.save
  end

  def update
    redirect_to root_path unless @card.update(card_params)
  end

  def destroy
    @card.destroy
    head :ok
  end

  private
    def set_card
      @card = Card.find(params[:id]) if params[:id]
    end

    def card_params
      params.require(:card).permit(:list_id, :title, :description, :position, :previous_list_id, attachments: [])
    end
end
