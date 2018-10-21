require 'cnn_word_frequency'

describe "#cnn_word_frequency" do

  it "should return a hash of cnn article words" do
    expect(cnn_word_frequency("")).to be_a Hash
  end

  it "should return only words longer than 3 letters" do
    hash.keys.each { |key| expect(key).to have_at_least(4).characters }
  end
end
