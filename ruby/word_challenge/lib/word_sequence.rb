# Words with single quote characters, periods, and numbers have been ommited as they are
# not considered letters.

require 'open-uri'

class WordSequence
  def retrieve_words(url)
    words = []
    open(url) { |f|
      f.each_line { |line| words << line.tr("\n","") }
    }
    words
  end

  def filter_words(array)
    filtered_words = []
    array.each do |word|
      unless (word.length < 4 || word.include?(".") || word.include?("'") \
        || word.include?('0' || '1' || '2' || '3' || '4' || '5' || '6' || '7' || '8' || '9'))
        filtered_words << word
      end
    end
    filtered_words
  end

  def find_sequences(word_list)
    sequences = []
    words = []
    word_list.each do |word|
      idx = 3
      while idx < word.length
        sequence = word[idx - 3] + word[idx - 2] + word[idx - 1] + word[idx]
        unless sequences.include?(sequence)
          sequences << sequence
          words << word
        end
        idx += 1
      end
    end
    return sequences, words
  end

  def send_to_file(sequences, words)
    sequences_file = File.new("sequences.txt", "w")
    words_file = File.new("words.txt", "w")
    sequences.each do |sequence|
      sequences_file.write(sequence + "\n")
    end
    words.each do |word|
      words_file.write(word + "\n")
    end
  end
end
