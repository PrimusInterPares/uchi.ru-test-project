class TokenGenerator
  def self.decode(string)
    Base64.decode64(string)
  end

  def self.encode(data)
    salt = SecureRandom.hex
    Base64.encode64((data.try(:to_json) || data.to_s) + salt)
  end
end
