class PageController < ApplicationController
  before_action :require_auth, only: [:add_otp, :otp]
  before_action :verify_otp_status, except: [:otp]

  def index
  end

  def login
    if request.post?
      email = params[:email]
      password = params[:password]
      user = User.find_by(email: email)

      if user && user.authenticate(password)
        session[:user_id] = user.id
        session[:otp_passed] = false
        redirect_to root_path
      else
        flash[:error] = "Invalid email or password"
        redirect_to login_path
      end
    end
  end

  def otp
    if request.post?
      otp_code = params[:otp_code]
      if @user.authenticate_otp(otp_code)
        session[:otp_passed] = true
        redirect_to root_path
      else
        flash[:error] = "Invalid OTP code"
        redirect_to otp_path
      end
    end
  end

  def add_otp
    if request.post?
      otp_code = params[:otp_code]
      if @user.authenticate_otp(otp_code)
        @user.update!(otp_enabled: true)
        redirect_to root_path
      else
        flash[:error] = "Invalid OTP code"
        redirect_to add_otp_path
      end
    end
  end
end
