class PersonsController < ApplicationController
    before_action :authenticate_user!
    def profile
      @profile = User.find(current_user.id)
    end
end
