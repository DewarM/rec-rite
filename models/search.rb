require_relative("./album.rb")
require("fuzzy_match")

class Search

  def initialize(search_query)
    @search_query = search_query
  end

  def search_albums()
    results = []
    FuzzyMatch.new(Album.all, :read => :title, :threshold => 0.2).find_all_with_score(@search_query).each do |record, a, b|
      results << record
    end
    return results
  end


end
