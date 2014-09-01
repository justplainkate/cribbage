describe Player do
  
  subject { Player.new("Bob") }
  
  before(:each) do
    subject.name = "Bob"
  end
  
  it 'knows their name' do
    expect(subject.name).to eq "Bob"
  end
  
  it 'can update their name' do
    subject.name = "Ben"
    expect(subject.name).to eq "Ben"
  end
  
  it "has points" do
    expect(subject.points).to eq 0
  end
  
  context "hand" do
    
    subject(:player) do
      nick = Player.new("Nick")
    end
    
    before(:each) do
      player.remove_all
      player << Card.new(2, :spades)
      player << Card.new(3, :spades)
      player << Card.new(4, :spades)
      player << Card.new(5, :spades)
    end
    
    it "can be given a card" do
      card = Card.new(7, :clubs)
      card.face :up
      player << card
      expect( player.has_card? 7, :clubs ).to be true
      expect( card.facing ).to eq :down
    end
    
    it "can remove a card" do
      pulled = player.remove(2, :spades)
      expect( player.card_count ).to eq 3
      expect( pulled.to_s ).to eq "2 of Spades"
    end
    
    it "can't be given a duplicate card" do
      player << Card.new(3, :spades)
      expect( player.card_count ).to eq 4
    end
    
    it '#find_card' do
      expect( player.respond_to? :find_card ).to be true
    end
    
    xit "something" do
      expect yadda
    end
    
    it "find_card returns nil if card not found" do
      expect( player.find_card(:jack, :hearts) ).to be nil
    end
    
    it "finds the card" do
      expect( player.find_card(5, :spades) ).to be 3
    end
    
    it "verify that the card is in there" do
      expect( player.has_card?(5, :spades) ).to be true
      expect( player.has_card?(:queen, :diamonds) ).to be false
    end
    
    
    
  end
  
  
end


=begin
    play a card
    verify played cards
    verify unplayed cards
    remove cards from hand 
=end