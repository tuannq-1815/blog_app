class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @entry = current_user.entries.build
    @feed_items = current_user.entries.feed_entry.page params[:page]
  end
end
