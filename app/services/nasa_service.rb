class NasaService

  def initialize(path, params)
    @conn = Faraday.new('https://api.nasa.gov/neo/rest/v1')
    @path = path
    @params = { api_key: ENV['NASA_KEY'] }.merge(params)
  end

  def self.get_endpoint(path, params = {})
    new(path, params).data
  end

  def data
    JSON.parse(response.body)
  end

  private
    attr_reader :conn, :params, :path

    def response

      conn.get(path, params)
    end
  end


    # def danger
    #   data.max_by do |date, asteroids|
    #     asteroids.count do |asteroid|
    #       asteroid['is_potentially_hazardous_asteroid']
    #     end
    #   end
    # end

    # def get_asteroids
    #   danger.last.map do |raw_asteroid|
    #     Asteroid.new(raw_asteroid)
    #   end
    # end
