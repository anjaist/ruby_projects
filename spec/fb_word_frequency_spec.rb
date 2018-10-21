require 'fb_word_frequency'

describe "#fb_word_frequency" do

  text_path = File.dirname(__FILE__) + "test_text.txt"

  it "should return a hash of facebook wall posts" do
    expect(fb_word_frequency("")).to be_a Hash
  end

  it "should return only words longer than 3 letters" do
    hash.keys.each { |key| expect(key).to have_at_least(4).characters }
  end

  it "should compute hash of most frequent words" do
    expect(most_common_words(text_path, 6)).to eq ({
      "harry" => 79,
      "dudley" => 54,
      "that" => 31,
      "aunt" => 27,
      "with" => 24,
      "said" => 23
    })
  end
end
