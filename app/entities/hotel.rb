class Hotel
  attr_accessor :owner, :position
  def initialize position
    @owner = nil
    @position = position
    @plan = nil
    
  end
  def plan
    @plan
  end

  def update_owner player
    @owner = player
  end

  def upgrade_plan plan
    @plan = plan
  end

  def pay_rent_or_upgrade_plan player

    if @owner.nil?
        player.decrease_balance Config.instance.data[:hotel][:silver][:value]
        Bank.instance.increase_balance Config.instance.data[:hotel][:silver][:value]
        update_owner player
        upgrade_plan 'silver'
      elsif @owner == player
        if @plan == 'silver'
          delta = Config.instance.data[:hotel][:gold][:value] - Config.instance.data[:hotel][:silver][:value]
          player.decrease_balance (delta)
          Bank.instance.increase_balance (delta)
          upgrade_plan 'gold'
        elsif @plan == 'gold'
          delta = Config.instance.data[:hotel][:platinum][:value] - Config.instance.data[:hotel][:gold][:value]
          player.decrease_balance (delta)
          Bank.instance.increase_balance (delta)
          upgrade_plan 'platinum'
        end
      else
        player.decrease_balance (Config.instance.data[:hotel][@plan.to_sym][:rent])
          @owner.increase_balance (Config.instance.data[:hotel][@plan.to_sym][:rent])
      end

  end

end
