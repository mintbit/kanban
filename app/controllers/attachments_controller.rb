class AttachmentsController < ApplicationController
  before_action :set_attachment

  def destroy
    redirect_to root_path unless @attachment.purge
  end

  private
    def set_attachment
      @attachment = ActiveStorage::Attachment.find(params[:id]) if params[:id]
    end
end
