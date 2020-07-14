class SearchController < ApplicationController
  def index
    response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/characters?perPage=${497}?page=${497}")
    parsed = JSON.parse(response.body)
    nation = nil
    if params[:nation] == "fire_nation"
      nation = "Fire Nation"
    end
    @results = parsed.find_all{ |character| character["affiliation"] == nation }
  end
end
