class NasaService

  def initialize(start_date, end_date)
    @conn = Faraday.new('https://api.nasa.gov/neo/rest/v1')
    @path = 'feed'
    @params = {
        api_key: ENV['NASA_KEY'],
        start_date: start_date,
        end_date: end_date
      }
  end

  def get_asteroids
    danger.last.map do |raw_asteroid|
      Asteroid.new(raw_asteroid)
    end
  end

  private
    attr_reader :conn, :params, :path

    def response
      # binding.pry
      conn.get(path, params)
    end

    def data
      JSON.parse(response.body)['near_earth_objects']
    end

    def danger
      data.max_by do |date, asteroids|
        asteroids.count do |asteroid|
          asteroid['is_potentially_hazardous_asteroid']
        end
      end
    end
end
