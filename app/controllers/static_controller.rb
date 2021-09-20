class StaticController < ApplicationController
  def welcome
    @disable_heading = true
    # authorized_redirect
    render :welcome
  end
end
