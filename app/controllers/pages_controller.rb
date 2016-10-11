class PagesController < ApplicationController
  # to include get_unread_count
  include ApplicationHelper

  #counts unread emails in current user inbox
  before_action :get_unread_count

  def show
    render template: 'pages/about'
  end


end
