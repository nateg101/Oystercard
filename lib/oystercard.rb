# frozen_string_literal: true

class Oystercard
  attr_accessor :balance, :entry_station

  MAX_BALANCE = 90
  MIN_FARE = 1 # min_fare would be equivalent to min_balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance is #{MAX_BALANCE}." if over_maximum?(amount)

    self.balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds to travel.' if insufficient_balance?

    @entry_station = station
    in_journey?
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
    !in_journey?
  end

  def in_journey?
    return true if entry_station
    false
  end

  private

  def deduct(amount)
    self.balance -= amount
  end

  def insufficient_balance?
    self.balance < MIN_FARE
  end

  def over_maximum?(amount)
    self.balance + amount > MAX_BALANCE
  end
end
