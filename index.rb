require 'active_support'

ActiveSupport::Dependencies.autoload_paths = [
  'app/',
  'app/entities',
  'config/'
]
CELLS = "J,H,L,H,E,L,H,L,H,J"
DICE_OUTPUT = "2,2,1,4,4,2,4,4,2,2,2,1"
NO_OF_PLAYERS = 3
obj = Game.new(CELLS,DICE_OUTPUT,NO_OF_PLAYERS)
obj.start