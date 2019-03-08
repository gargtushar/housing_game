require 'singleton'

class Bank
  include Singleton

  attr_accessor :balance

  def initialize
    @balance = Config.instance.data[:initial_bank_balance]
  end
  def increase_balance amount
    @balance = @balance + amount
  end

  def decrease_balance amount
    @balance = @balance - amount
  end
end
