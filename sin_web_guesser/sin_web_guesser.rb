# frozen_string_literal: true

# http://tutorials.jumpstartlab.com/projects/web_guesser.html#i3:-guessing-numbers
require 'sinatra'
require 'sinatra/reloader'

# set :random_number, rand(100)
set :random_number, proc { rand(100) }

# these 3 do the same thing
# @@random_number = rand(100)
# @@random_number = settings.random_number
@@random_number = settings.random_number
@@color = 'black'
message = ''
MAX_GUESSES = 10
@@m2 = ''
@@cheat = false
@@cheat_string = ''
@@guesses = 0
get '/' do
  guess = params['guess']
  message = check_guess(guess)
  @@cheat = params['cheat']
  @@cheat_string = "The secret number is #{@@random_number}." if @@cheat == true
  if message.include?('TOO')
    reset
    @@m2 = 'Try to guess a new number!'
    @@random_number = settings.random_number

  end
  erb :index, locals: { number: @@random_number, guess: guess, message: message }
end
def reset
  @@cheat_string = "The secret number is #{@@random_number}." if @@cheat == true
  @@guesses = 0
  @@random_number = settings.random_number
end

def check_guess(guess)
  return '' if guess.nil?

  guess = guess.to_i
  if guess == @@random_number
    m = 'Good guess!'
    @@color = 'green'
  elsif (guess - @@random_number) > 10
    m = "#{guess} is way too high"
    @@color = 'DarkRed'
  elsif (@@random_number - guess) > 10
    m = "#{guess} is way too low"
    @@color = 'DarkRed'
  elsif guess > @@random_number
    m = "#{guess} is too high"
    @@color = 'red'
  elsif guess < @@random_number
    m = "#{guess} is too low"
    @@color = 'red'
  end
  @@guesses += 1
  m = 'TOO MANY GUESSES, GIT GUD' if @@guesses >= MAX_GUESSES && guess != @@random_number
  m
end
