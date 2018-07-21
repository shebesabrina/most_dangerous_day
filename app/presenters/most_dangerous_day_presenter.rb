class MostDangerousDayPresenter

  attr_reader :start_date,
              :end_date,
              :asteroids,
              :day

  def initialize(start_date, end_date)
    @start_date = Date.parse(start_date).strftime('%B %e, %Y')
    @end_date = Date.parse(end_date).strftime('%B %e, %Y')
    @asteroids = NasaService.new(start_date, end_date).get_asteroids
  end

  # def response
  #   Faraday.get('https://api.nasa.gov/neo/rest/v1/feed?start_date=2018-01-01&end_date=2018-01-07&api_key=8wqO4pkqRPaEXJn7ZC7vfZzFIxLyBFPWJCWT9Ugd')
  # end
  #
  # def data
  #   JSON.parse(response.body)['near_earth_objects']
  # end
  #
  # def danger
  #   data.max_by do |date, asteroids|
  #     asteroids.count do |asteroid|
  #       asteroid['is_potentially_hazardous_asteroid']
  #     end
  #   end
  # end
end
