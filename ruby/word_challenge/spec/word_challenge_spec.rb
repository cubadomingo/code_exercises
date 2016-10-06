require 'spec_helper'
require 'word_sequence'

RSpec.describe WordSequence do

  describe ".filter_words" do
    context "given an array of words" do

      it "filters characters that are not letters" do
        array = ["string", "hello", "U.S.A", "You'll", "10th"]
        expect(WordSequence.filter_words(array)).to eq(["string", "hello"])
      end
    end
  end

  describe ".find_sequences" do
    context "given an array of words" do

      array = ["arrows", "carrots", "give"]
      sequences, words = WordSequence.find_sequences(array)

      it "return sequences of four letters from each word" do
        expect(sequences).to eq(["arro", "rrow", "rows",
                                 "carr", "rrot", "rots",
                                 "give"])
      end

      it "returns word of every sequence" do
        expect(words).to eq(["arrows", "arrows", "arrows",
                             "carrots", "carrots", "carrots",
                             "give"])
      end
    end
  end

  describe ".send_to_file" do
    context "given an array of sequences and an array of words" do

      sequences = ["arro", "rrow", "rows",
                   "carr", "rrot", "rots",
                   "give"]
      words = ["arrows", "arrows", "arrows",
               "carrots", "carrots", "carrots",
               "give"]
      WordSequence.send_to_file(sequences, words)

      it "creates a new sequences.txt file with the sequences" do
        sequences_check = []
        words_check = []
        File.exists? "sequences.txt"
        f = File.open("sequences.txt", "r")
        f.each_line { |line| sequences_check << line.tr("\n", "")}
      end

      it "creates a new words.txt file with the word of each sequence" do
        File.exists? "words.txt"
        f = File.open("words.txt", "r")
        f.each_line { |line| words_check << line.tr("\n", "")}
      end
    end
  end
end
