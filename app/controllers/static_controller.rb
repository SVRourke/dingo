class StaticController < ApplicationController
    def welcome
        # authorized_redirect
        render :welcome
    end
end