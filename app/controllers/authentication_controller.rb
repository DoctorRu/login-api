class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate

        # curl -H "Content-Type: application/json" -X POST -d '{"email":"example@mail.com","password":"123123123"}' http://localhost:4000/authenticate
        
        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
            render json: { auth_token: command.result }
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end
end
