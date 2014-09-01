class Card
  
  SUITS = [:hearts, :diamonds, :spades, :clubs]
  PIPS = [:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]
  
  def initialize(pip, suit)
    @pip = pip
    @suit = suit
    @facing = :down
    raise ArgumentError, "Not a valid card." unless valid?
  end
  
  def valid?
    valid_suit = SUITS.include? @suit
    valid_pip = PIPS.include? @pip
    valid_suit && valid_pip
  end
  
  def face(direction)
    case direction
    when :up, :down 
      @facing = direction
    else
      @facing = :down
    end
    self
  end
  
  def facing
    @facing
  end
    
  def suit
    @suit
  end
  
  def pip
    @pip
  end
  
  def value
    case pip
    when :ace
      1
    when :jack, :queen, :king
      10
    else
      pip
    end
    
  end
  
  def to_s
    "#{@pip.to_s.capitalize} of #{@suit.to_s.capitalize}"
  end
  
end