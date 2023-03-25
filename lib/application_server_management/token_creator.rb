module ApplicationServerManagement
class TokenCreator
  attr_accessor :application_server, :time, :token
  
  def initialize(application_server)
    @application_server = application_server
    @time = Time.now
  end

  def create_token
    application_server.tokens.build(access_token: access_token, refresh_token: refresh_token, is_active: true, expiry_date: expiry_date)
  end
  
  def regenerate_token
    update_token_status
    create_token
  end
  
  def update_token_status
    if active_token.present?
      return true if active_token.update(is_active: !token.is_active)
    else
      return true
    end
    false
  end

  def active_token
    @token ||= application_server.tokens.where(is_active: true).last
  end

  
  private
  
  def access_token
    payload = {
      app_code: application_server.code,
      exp: expiry_date.to_i
    }
    algorithm = 'HS512'
    JWT.encode(payload, 'SECRET_KEY', algorithm)
  end

  def refresh_token
    ""
  end

  def expiry_date
    time+1.month
  end

end
end