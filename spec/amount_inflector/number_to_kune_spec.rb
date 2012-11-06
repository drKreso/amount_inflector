#encoding:utf-8
require 'amount_inflector/number_to_kune.rb'

describe NumberToKune do
  it 'converts 100 kunas' do
    NumberToKune.convert(100).should == "sto kuna i nula lipa"
  end

  it 'converts 200 kunas' do
    NumberToKune.convert(200).should == "dvjesto kuna i nula lipa"
  end

  it 'converts 10 kuna' do
    NumberToKune.convert(10).should == "deset kuna i nula lipa"
  end

  it 'converts 3 kune' do
    NumberToKune.convert(3).should == "tri kune i nula lipa"
  end

  it 'converts 24 kune' do
    NumberToKune.convert(24).should == "dvadesetčetiri kune i nula lipa"
  end

  it 'converts 27 kune' do
    NumberToKune.convert(27).should == "dvadesetsedam kuna i nula lipa"
  end


end
