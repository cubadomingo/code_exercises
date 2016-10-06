require_relative 'word_sequence'

class WordChallenge < WordSequence
  url = 'https://dl.dropboxusercontent.com/u/14065136/dictionary.txt'
  sequences, words = find_sequences(filter_words(retrieve_words(url)))
  send_to_file(sequences, words)
  puts "  The sequences of four letter words have been created and placed
  in the sequences.txt file in this directory. The word list for each
  sequence has also been created and placed in the words.txt file in
  this directory."
end
