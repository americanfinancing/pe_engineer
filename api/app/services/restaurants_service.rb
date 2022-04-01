class RestaurantsService
  require 'net/http'

  def self.call
    uri = URI(request_url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    data
  end

  private

  def self.request_url
    'http://backend-api:4567/api/restaurants'
  end
end
