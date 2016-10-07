require_relative 'word_sequence'

sequence = WordSequence.new

url = 'https://dl.dropboxusercontent.com/u/14065136/dictionary.txt'
sequences, words = sequence.
                   find_sequences(sequence.
                   filter_words(sequence.
                   retrieve_words(url)))
sequence.send_to_file(sequences, words)
puts "  The sequences of four letter words have been created and placed
in the sequences.txt file in the script directory. The word list for each
sequence has also been created and placed in the words.txt file in
the script directory."
