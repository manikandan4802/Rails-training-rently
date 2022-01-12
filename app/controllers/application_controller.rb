class ApplicationController < ActionController::Base
    before_action :authenticate_agent!
    def authenticate_user!
        redirect_to "http://stackoverflow.com/" unless agent_signed_in?
    end
end
