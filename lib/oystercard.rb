# frozen_string_literal: true
require_relative "journey_log"
require_relative "journey"

class Oystercard
  attr_accessor :balance
  attr_reader :log

  MAX_BALANCE = 90
  MIN_BALANCE= 1

  def initialize
    @balance = 0
    @log = JourneyLog.new
  end

  def top_up(amount)
    raise "Maximum balance is #{MAX_BALANCE}." if over_maximum?(amount)
    self.balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds to travel.' if insufficient_balance?
    @log.start(station)
  end

  def touch_out(station)
    @log.finish(station)
    deduct( (@log.journey_history.last).fare )
  end

  def in_journey?
    return true if @log.entry_station
    false
  end

  private

  def deduct(amount)
    self.balance -= amount
  end

  def insufficient_balance?
    self.balance < MIN_BALANCE
  end

  def over_maximum?(amount)
    self.balance + amount > MAX_BALANCE
  end
end
