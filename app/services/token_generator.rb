class TokenGenerator
  SALT = "a2729602816bc759cd5dfa178f7e808b".freeze

  def self.encode(data)
    OpenSSL::HMAC.hexdigest("SHA256", SALT, data.to_s)
  end
end
