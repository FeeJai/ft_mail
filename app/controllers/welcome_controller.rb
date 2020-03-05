class WelcomeController < ApplicationController
  def index
    if signed_in?
      @snailmails = current_user.snailmail.all
    end
  end
end
