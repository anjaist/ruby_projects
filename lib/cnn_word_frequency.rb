require 'open-uri'
require 'nokogiri'

def cnn_scraper(path)
  url = "https://edition.cnn.com/#{path}"
  document = Nokogiri::HTML(open(url).read)
  article_text = ''
  document.search('.Article__body').each do |element|
    article_text << element.text.strip
  end
  article_text.gsub(/[\!?&\-"\.,\d]|\'(l{2}|s|d)/, '').downcase.split(" ")
end

def cnn_word_frequency(path)
  p article_text = cnn_scraper(path)
end

cnn_word_frequency("travel/article/plane-sideways-landing-uk/index.html")
