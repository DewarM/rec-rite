require_relative("./album.rb")
require("fuzzy_match")

class Search

  def initialize(search_query)
    @search_query = search_query
  end

  def search_albums()
    FuzzyMatch.new(
      Album.all,
      :read => :title,
      :threshold => 0.2
    ).find_all_with_score(@search_query).map do |record, score_d, score_l|
      record
    end
  end


end
