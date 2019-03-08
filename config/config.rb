require 'singleton'

class Config
  include Singleton

  attr_accessor :data

  def initialize
    @data = {
      initial_bank_balance:5000,
      initial_player_balance: 1000,
      jail_fine: 150,
      lottery_value:200,
      hotel:{
        silver:{
          value:200,
          rent:50
        },
        gold:{
          value:300,
          rent:150
        },
        platinum:{
          value:500,
          rent:300
        }
      }
    }
  end
end
