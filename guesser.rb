class Guesser

  @@guesses = 5

  @@secret_number = rand(100)

  def self.check_difference(num1, num2)
    num1 - num2 > 5
  end

  def self.reset
    @@secret_number = rand(100)
    @@guesses = 5
  end

  def self.handle_guess(guess)
    if check_difference(guess, @@secret_number)
      @@guesses -= 1
      "Way too high!"
    elsif guess > @@secret_number
      @@guesses -= 1
      "Too high!"
    elsif check_difference(@@secret_number, guess)
      @@guesses -= 1
      "Way too low!"
    elsif guess < @@secret_number
      @@guesses -= 1
      "Too low!"
    else
      message = "You got it right! The number was #{@@secret_number}. Let's play again!"
      reset
      message
    end
  end

  def self.check_guess(guess)
    if @@guesses == 0
      message = "The number was #{@@secret_number}. The secret number is reset. Let's play again!"
      reset
      message
    else
      handle_guess(guess)
    end
  end
end
