describe Card do
  
  subject { Card.new(:jack, :hearts) }
  
  it 'knows its suit' do
    expect(subject.suit).to eq :hearts
  end
  
  it 'knows its pip' do
    expect(subject.pip).to eq :jack
  end
  
  it 'knows how to describe itself in words' do
    expect(subject.to_s).to eq 'Jack of Hearts'
  end
  
  it 'won\'t let you create invalid cards' do
    expect{ Card.new(nil, :joker) }.to raise_error(ArgumentError)
  end
  
  it "can be flipped up" do
    subject.face(:up)
    expect( subject.facing ).to eq :up
  end
  
  it "faces down when told to face invalid direction" do
    subject.face(:left)
    expect( subject.facing ).to eq :down
  end
  
  context "face values" do
        
    it "Ace is 1" do
      ace_card = Card.new(:ace, :hearts)
      expect( ace_card.value ).to eq 1
    end
    
    it "King is 10" do
      king_card = Card.new(:king, :hearts)
      expect( king_card.value ).to eq 10
    end
    
  end
  
end