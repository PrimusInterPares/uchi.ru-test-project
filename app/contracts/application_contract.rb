class ApplicationContract < Dry::Validation::Contract
  def self.call(...) = new.call(...)
end
