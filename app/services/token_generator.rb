class TokenGenerator
  def self.encode(data)
    salt = Rails.application.credentials[:salt]
    OpenSSL::HMAC.hexdigest("SHA256", salt, data.to_s)
  end
end
