require_relative '../lib/amount_inflector.rb'

describe AmountInflector do

  it 'should say 1 godina' do
    trajanje = AmountInflector.new(1, :godina)
    trajanje.to_s.should == "1 godina"
  end

  it 'should say 2 godine' do
    trajanje = AmountInflector.new(2, :godina)
    trajanje.to_s.should == "2 godine"
  end

  it 'should say 92 godine' do
    trajanje = AmountInflector.new(92, :godina)
    trajanje.to_s.should == "92 godine"
  end

  it 'should say 12 godina' do
    trajanje = AmountInflector.new(12, :godina)
    trajanje.to_s.should == "12 godina"
  end

  it 'should say 2012 godina' do
    trajanje = AmountInflector.new(2012, :godina)
    trajanje.to_s.should == "2012 godina"
  end

  it 'should say 5 godina' do
    trajanje = AmountInflector.new(5, :godina)
    trajanje.to_s.should == "5 godina"
  end

  it 'should say 1 tjedan' do
    trajanje = AmountInflector.new(1, :tjedan)
    trajanje.to_s.should == "1 tjedan"
  end

  it 'should say 5 tjedana' do
    trajanje = AmountInflector.new(5, :tjedan)
    trajanje.to_s.should == "5 tjedana"
  end

  it 'should say 11 tjedana' do
    trajanje = AmountInflector.new(11, :tjedan)
    trajanje.to_s.should == "11 tjedana"
  end

  it 'should sayl 55 tjedana' do
    trajanje = AmountInflector.new(55, :tjedan)
    trajanje.to_s.should == "55 tjedana"
  end

  it 'should say 3 tjedna' do
    trajanje = AmountInflector.new(3, :tjedan)
    trajanje.to_s.should == "3 tjedna"
  end

  it 'should sayl 53 tjedana' do
    trajanje = AmountInflector.new(53, :tjedan)
    trajanje.to_s.should == "53 tjedna"
  end

  it 'should say 4 tjedna' do
    trajanje = AmountInflector.new(4, :tjedan)
    trajanje.to_s.should == "4 tjedna"
  end

  it 'should say 50 tjedana' do
    trajanje = AmountInflector.new(50, :tjedan)
    trajanje.to_s.should == "50 tjedana"
  end

  it 'should say 1 dan' do
    trajanje = AmountInflector.new(1, :dan)
    trajanje.to_s.should == "1 dan"
  end

  it 'should say 2 dana' do
    trajanje = AmountInflector.new(2, :dan)
    trajanje.to_s.should == "2 dana"
  end

  it 'should say 3 dana' do
    trajanje = AmountInflector.new(3, :dan)
    trajanje.to_s.should == "3 dana"
  end

  it 'should say 11 dana' do
    trajanje = AmountInflector.new(11, :dan)
    trajanje.to_s.should == "11 dana"
  end

  it 'should say 12 dana' do
    trajanje = AmountInflector.new(12, :dan)
    trajanje.to_s.should == "12 dana"
  end

  it 'should say 13 dana' do
    trajanje = AmountInflector.new(13, :dan)
    trajanje.to_s.should == "13 dana"
  end

  it 'should say 21 dan' do
    trajanje = AmountInflector.new(21, :dan)
    trajanje.to_s.should == "21 dan"
  end

  it 'should raise for unknows inflection 1 danas' do
    ->{ trajanje = AmountInflector.new(1, :danas) }.should raise_error 'Inflection :danas is unsupported'
  end

  it 'should raise for no default 2 erorr_no_default_dan' do
    errors_in_inflections = { "error_no_default_dan" => { 1 => :dan, 2 => :dana } } 
    ->{ trajanje = AmountInflector.new(1, :error_no_default_dan, errors_in_inflections) }.should raise_error 'No default inflection for :error_no_default_dan'
  end

end
