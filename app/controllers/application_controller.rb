class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    # before_action :authenticate_agent!
    # def authenticate_user!
    #     puts("602365823198237560686189568716,#{params}")
    #     redirect_to "http://stackoverflow.com/" unless agent_signed_in?
    # end
end
