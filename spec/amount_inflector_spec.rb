require_relative '../lib/amount_inflector.rb'

describe AmountInflector do

  it 'should say 1 godina' do
    AmountInflector.inflect(1, :godina).should == "1 godina"
  end

  it 'should say 2 godine' do
    AmountInflector.inflect(2, :godina).should == "2 godine"
  end

  it 'should say 92 godine' do
    AmountInflector.inflect(92, :godina).should == "92 godine"
  end

  it 'should say 12 godina' do
    AmountInflector.inflect(12, :godina).should == "12 godina"
  end

  it 'should say 2012 godina' do
    AmountInflector.inflect(2012, :godina).should == "2012 godina"
  end

  it 'should say 5 godina' do
    AmountInflector.inflect(5, :godina).should == "5 godina"
  end

  it 'should say 1 tjedan' do
    AmountInflector.inflect(1, :tjedan).should == "1 tjedan"
  end

  it 'should say 5 tjedana' do
    AmountInflector.inflect(5, :tjedan).should == "5 tjedana"
  end

  it 'should say 11 tjedana' do
    AmountInflector.inflect(11, :tjedan).should == "11 tjedana"
  end

  it 'should sayl 55 tjedana' do
    AmountInflector.inflect(55, :tjedan).should == "55 tjedana"
  end

  it 'should say 3 tjedna' do
    AmountInflector.inflect(3, :tjedan).should == "3 tjedna"
  end

  it 'should sayl 53 tjedana' do
    AmountInflector.inflect(53, :tjedan).should == "53 tjedna"
  end

  it 'should say 4 tjedna' do
    AmountInflector.inflect(4, :tjedan).should == "4 tjedna"
  end

  it 'should say 50 tjedana' do
    AmountInflector.inflect(50, :tjedan).should == "50 tjedana"
  end

  it 'should say 1 dan' do
    AmountInflector.inflect(1, :dan).should == "1 dan"
  end

  it 'should say 2 dana' do
    AmountInflector.inflect(2, :dan).should == "2 dana"
  end

  it 'should say 3 dana' do
    AmountInflector.inflect(3, :dan).should == "3 dana"
  end

  it 'should say 11 dana' do
    AmountInflector.inflect(11, :dan).should == "11 dana"
  end

  it 'should say 12 dana' do
    AmountInflector.inflect(12, :dan).should == "12 dana"
  end

  it 'should say 13 dana' do
    AmountInflector.inflect(13, :dan).should == "13 dana"
  end

  it 'should say 21 dan' do
    AmountInflector.inflect(21, :dan).should == "21 dan"
  end

  it 'should raise for unknows inflection 1 danas' do
#    ->{ trajanje = AmountInflector.new(1, :danas) }.should raise_error 'Inflection :danas is unsupported'
  end

end
