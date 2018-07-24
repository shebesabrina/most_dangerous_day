class MostDangerousDayPresenter

  attr_reader :start_date,
              :end_date,
              :asteroids,
              :date

  def initialize(start_date, end_date, raw_data)
    @start_date = Date.parse(start_date).strftime('%B %e, %Y')
    @end_date = Date.parse(end_date).strftime('%B %e, %Y')
    @asteroids = raw_data.last.map do |raw_asteroid|
      Asteroid.new(raw_asteroid)
    end
    @date = Date.parse(raw_data.first).strftime('%B %e, %Y')
  end


  def self.combine(start_date, end_date)
    raw_data = data(start_date, end_date)
    new(start_date, end_date, raw_data)
  end

  def self.data(start_date, end_date)
    NasaService.get_endpoint('feed', {start_date: start_date, end_date: end_date})['near_earth_objects'].max_by do |date, asteroids|
      asteroids.count do |asteroid|
        asteroid['is_potentially_hazardous_asteroid']
      end
    end
  end
end
  # def response
  #   Faraday.get('https://api.nasa.gov/neo/rest/v1/feed?start_date=2018-01-01&end_date=2018-01-07&api_key=8wqO4pkqRPaEXJn7ZC7vfZzFIxLyBFPWJCWT9Ugd')
  # end
  #


  # def data
  #   JSON.parse(response.body)['near_earth_objects']
  # def self.danger
  #   data.max_by do |date, asteroids|
  #     asteroids.count do |asteroid|
  #       asteroid['is_potentially_hazardous_asteroid']
  #     end
  #   end
  # end
  # end
