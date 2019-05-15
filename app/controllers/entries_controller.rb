class EntriesController < ApplicationController
  before_action :correct_user, only: %i(destroy)

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = t ".micropost_created"
      redirect_to root_url
    else
      @feed_items = current_user.entries.feed_entry.page params[:page]
      render "static_pages/home"
    end
  end

  def destroy
    if @entry.destroy
      flash[:success] = t ".entry_deleted"
      redirect_to request.referrer
    else
      flash[:error] = t ".delete_unsuccessful"
      redirect_to root_path
    end
  end

  private
    def correct_user
      @entry= current_user.entries.find_by id: params[:id]
      redirect_to root_url if @entry.nil?
    end

    def entry_params
      params.require(:entry).permit(:content)
    end
end
