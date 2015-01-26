defmodule Chop do
  def guess(actual, a..b) do
    first_guess = div(a + b, 2)

    make_guess(actual, a..b, first_guess)
  end

  def make_guess(actual, _, current_guess) when actual == current_guess do
    current_guess
  end

  def make_guess(actual, a.._, current_guess) when current_guess > actual do
    next_guess = div(a + (current_guess - 1), 2)

    make_guess(actual, a..current_guess, next_guess)
  end

  def make_guess(actual, _..b, current_guess) when current_guess < actual do
    next_guess = div((current_guess + 1) + b, 2)

    make_guess(actual, current_guess..b, next_guess)
  end
end
