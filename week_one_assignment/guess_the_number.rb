def start_game
  puts "Let's play Guess The Number\n\tPick a difficulty level (1, 2, or 3) "
  player_guess_with_new_number(gets.chop.to_i)
end

def player_guess_with_new_number(difficulty)
  difficulty >= 1 && difficulty <= 3 ? player_guess("I have my number.", rand(10**difficulty) + 1, []) : start_game
end

def player_guess(message, number, guesses)
  puts "#{message} What's your guess? "
  guesses << gets.chop.to_i
  guesses.last == number ? final_output(guesses.length) : guess_again(number, guesses)
end

def guess_again(number, guesses)
  return player_guess("Guesses must be a number greater than 0.", number, guesses) unless guesses.last > 0
  player_guess("Too #{number < guesses.last ? 'high' : 'low'}. Guess again.", number, guesses)
end

def final_output(number_of_guesses)
  puts "You got it in #{number_of_guesses} #{guess_or_guesses(number_of_guesses)} #{final_comment(number_of_guesses)}"
end

def final_comment(number_of_guesses)
  return "Better luck next time." unless number_of_guesses < 7
  ["You're a mind reader!",  "Most impressive.",  "You can do better than that."][[0, 0, 1, 1, 1, 2, 2][number_of_guesses]]
end

def guess_or_guesses(number_of_guesses)
  number_of_guesses == 1 ? "guess!" : "guesses."
end

start_game