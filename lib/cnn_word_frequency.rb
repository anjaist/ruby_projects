require 'open-uri'
require 'nokogiri'

def cnn_scraper(path)
  url = "https://edition.cnn.com/#{path}"
  document = Nokogiri::HTML(open(url).read)
  article_text = ''
  document.search('.Article__body').each { |x| article_text << x.text.strip }
  article_text.gsub(/[\!?&\-"\.,\d]|\'(l{2}|s|d|re)/, '').downcase.split(' ')
end

def cnn_word_frequency(path, number_of_words)
  article_text = cnn_scraper(path)
  words = Hash.new(0)
  article_text.each do |word|
    words[word] += 1 if word.length > 4
  end
  highest_reps = words.values.sort.reverse[0..number_of_words]
  words.select { |_k, v| highest_reps.include? v }
end

# p cnn_word_frequency('travel/article/plane-sideways-landing-uk/index.html', 4)
# p cnn_word_frequency('travel/article/laurie-woolever-anthony-bourdain-assistant/index.html?iid=ob_lockedrail_topeditorial', 3)
