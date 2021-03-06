class UsersController < ApplicationController
  def index
    @users = User.geocoded.where(role: "recycler")
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "users/info_window", locals: { user: user })
      }
    end
  end
end
