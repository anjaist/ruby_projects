require 'cnn_word_frequency'

describe '#cnn_word_frequency' do
  result_hash = cnn_word_frequency('travel/article/plane-sideways-landing-uk/index.html', 7)

  it 'should return a hash of cnn article words' do
    expect(cnn_word_frequency('', 1)).to be_a Hash
  end

  it 'should return only words longer than 4 letters' do
    expect(words_length(result_hash)).not_to include(1, 2, 3, 4)
  end
end

def words_length(a_hash)
  lengths = []
  a_hash.each_key do |word|
    lengths << word.length
  end
  lengths.uniq
end
