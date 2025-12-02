class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
      puts current_or_guest_user.inspect
  end
end
