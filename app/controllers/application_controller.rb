class ApplicationController < ActionController::API
  secret=ENV['JWT_SECRET']

  def authenticate
    decode_data = decode_user_data(request.headers["token"])
    user_data = decode_data[0]["user_id"] unless !decode_data
    user = User.find(user_data&.id)
    if user
      return true
    else
      render json: { message: "invalid credentials" }
    end
  end

  def encode_user_data(payload)
    JWT.encode payload, SECRET, "HS256"
  end

  def decode_user_data(token)
    begin
      JWT.decode token, SECRET, true, { algorithm: "HS256" }
    rescue => e
      puts e
    end
  end
end
