class Film
  URL = "https://www.kinopoisk.ru/top/lists/1/filtr/all/sort/order/perpage/200"
  attr_reader :director, :title, :year
  
  def self.all_from_list
    films = []
    html = open(URL)
    doc = Nokogiri::HTML(html)
    doc.css('table#itemList .news').each do |movie|
      title_parsed = movie.css("a").first.text
      director_parsed = movie.css('.gray_text a').first.text
      year_parsed = movie.css("span").first.text.scan(/\d{4}/)[0]
      films << Film.new(director_parsed, title_parsed, year_parsed)
    end
    films
  end

  def initialize(director, title, year)
    @director = director
    @title = title
    @year = year
  end

  def to_s
    "#{@director.chomp} - #{@title.chomp} (#{@year.chomp})"
  end
end
