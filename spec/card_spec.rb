describe Card do
  
  subject { Card.new(:jack, :hearts) }
  
  it 'knows its suit' do
    expect(subject.suit).to eq :hearts
  end
  
  it 'knows its value' do
    expect(subject.value).to eq :jack
  end
  
  it 'knows how to describe itself in words' do
    expect(subject.to_s).to eq 'Jack of Hearts'
  end
  
end