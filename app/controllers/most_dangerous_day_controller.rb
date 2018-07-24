class MostDangerousDayController < ApplicationController
  def index
    @most_dangerous_day = MostDangerousDayPresenter.combine(params['start_date'], params['end_date'])
  end
end
