class Player
  
  def initialize(name)
    @name = name
    @points = 0
    @hand = []
  end
  
  def name
    @name
  end
  
  def name=(new_name)
    @name = new_name
  end
  
  def points
    @points
  end
  
  # move a card into the crib
  # empty cards back to dealer
  
  def find_card(pip, suit)
    @hand.index {|card| card.pip == pip && card.suit == suit }
  end
  
  def has_card?(pip, suit)
    !!find_card(pip, suit)
  end
  
  def play_card(pip, suit)
    card = @hand[find_card(pip, suit)]
    card.face(:up) if card
  end
  
  def <<(card)
    @hand << card
    card.face :down
    @hand.uniq! {|card| card.to_s }
  end
  
  def played_cards
    @hand.select {|card| card.facing == :up }
  end
  
  def unplayed_cards
    @hand.select {|card| card.facing == :down }
  end
  
  def card_count
    @hand.size
  end
  
  def remove(pip, suit)
    position = find_card(pip, suit)
    @hand.delete_at(position) if position
  end
  
  def remove_all
    old_hand = @hand
    @hand = []
    old_hand
  end

    
end