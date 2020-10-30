require 'faker'

module UsersHelper
  def zipcode
    Faker::Address.zip_code
  end
end
