class Player
  attr_accessor :balance, :position, :name, :loan_amonut, :dice_number
  def initialize name
    @balance = Config.instance.data[:initial_player_balance]
    @position = 0
    @name = name
    @dice_number = 0
  end

  def increase_balance amount
    @balance = @balance + amount
  end

  def decrease_balance amount
    @balance = @balance - amount
  end


  def dice no
    @dice_number = no.to_i
    puts "Hi #{self.name}, You got #{self.dice_number}"
  end

  def go_steps cells,hotels
    no_of_cells = cells.count
    @position = @position + @dice_number
    @position = @position -no_of_cells  if @position > no_of_cells
    self.update_balance cells,hotels
  end

  def update_balance cells,hotels
    print "Hi #{self.name} you got #{cells[@position-1]}"
    case cells[@position-1]
    when "J"
      decrease_balance Config.instance.data[:jail_fine]
      Bank.instance.increase_balance Config.instance.data[:jail_fine]
    when "L"
      increase_balance Config.instance.data[:lottery_value]
      Bank.instance.decrease_balance Config.instance.data[:lottery_value]

    when "H"
      hotels[@position].pay_rent_or_upgrade_plan self

    end


  end

end
