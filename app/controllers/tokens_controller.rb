class TokensController < Doorkeeper::TokensController
    def create
      begin
        debugger
        response = strategy.authorize
        self.headers.merge! response.headers
        self.response_body = response.body.to_json
        self.status = response.status
      rescue Doorkeeper::Errors::DoorkeeperError => e
        debugger
      end
    end  
end