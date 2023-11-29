class AuthController < ApplicationController
  before_action :require_auth, only: [:qr]

  def logout
    session[:user_id] = nil
    session[:otp_passed] = false
    redirect_to root_path
  end

  def qr
    require "rqrcode"

    totp = ROTP::TOTP.new(@user.otp_secret_key, issuer: "OTP Test")
    qrcode = RQRCode::QRCode.new(totp.provisioning_uri(@user.email))
    send_data qrcode.as_png(size: 500), type: 'image/png', disposition: 'inline'
  end
end
