class StaticController < ApplicationController
  before_action :authorized_redirect
  
  def welcome
    @disable_heading = true
    render :welcome
  end
end
