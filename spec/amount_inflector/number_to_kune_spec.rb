#encoding:utf-8
require 'amount_inflector/number_to_kune.rb'

describe NumberToKune do
  it 'converts 100 kunas' do
    NumberToKune.convert(100).should == "sto kuna i nula lipa"
  end

  it 'converts 200 kunas' do
    NumberToKune.convert(200).should == "dvjesto kuna i nula lipa"
  end

  it 'converts 200.26 kunas' do
    NumberToKune.convert(200.26).should == "dvjesto kuna i dvadesetšest lipa"
  end

  it 'converts 10 kuna' do
    NumberToKune.convert(10).should == "deset kuna i nula lipa"
  end

  it 'converts 3 kune' do
    NumberToKune.convert(3).should == "tri kune i nula lipa"
  end

  it 'converts 18 kune' do
    NumberToKune.convert(18).should == "osamnaest kuna i nula lipa"
  end

  it 'converts 24 kune' do
    NumberToKune.convert(24).should == "dvadesetčetiri kune i nula lipa"
  end

  it 'converts 27 kune' do
    NumberToKune.convert(27).should == "dvadesetsedam kuna i nula lipa"
  end

  it 'converts 1000 kuna'  do
    NumberToKune.convert(1000).should == "tisuću kuna i nula lipa"
  end

  it 'converts 1965 kuna'  do
    NumberToKune.convert(1965).should == "tisućudevetstošezdesetpet kuna i nula lipa"
  end

  it 'converts 1965.337 kuna'  do
    NumberToKune.convert(1965.337).should == "tisućudevetstošezdesetpet kuna i tridesetčetiri lipe"
  end

  it 'converts 9875 kuna'  do
    NumberToKune.convert(9875).should == "devettisućaosamstosedamdesetpet kuna i nula lipa"
  end

  it 'converts 18654 kuna'  do
    NumberToKune.convert(18654).should == "osamnaesttisućašestopedesetčetiri kune i nula lipa"
  end

  it 'converts 2000000 kuna'  do
    NumberToKune.convert(2000000).should == "dvamilijuna kuna i nula lipa"
  end

  it 'converts 26432 kuna'  do
    NumberToKune.convert(26432).should == "dvadesetšesttisućačetiristotridesetdvije kune i nula lipa"
  end

  it 'converts 97543 kuna'  do
    NumberToKune.convert(97543).should == "devedesetsedamtisućapetstočetrdesettri kune i nula lipa"
  end

  it 'converts 197543 kuna'  do
    NumberToKune.convert(197543).should == "stodevedesetsedamtisućapetstočetrdesettri kune i nula lipa"
  end

  it 'converts 999999 kuna'  do
    NumberToKune.convert(999999).should == "devetstodevedesetdevettisućadevetstodevedesetdevet kuna i nula lipa"
  end

  it 'converts 121000000 kuna' do
    NumberToKune.convert(121000000).should == "stodvadesetjedanmilijun kuna i nula lipa"
  end

  it 'converts 21000000000 kuna' do
    NumberToKune.convert(21000000000).should == "dvadesetjednamilijarda kuna i nula lipa"
  end

  it 'converts 121000000000 kuna' do
    NumberToKune.convert(121000000000).should == "stodvadesetjednamilijarda kuna i nula lipa"
  end

  it 'converts 21000000 kuna' do
    NumberToKune.convert(21000000).should == "dvadesetjedanmilijun kuna i nula lipa"
  end

  it 'convert 1000000 kuna' do
    NumberToKune.convert(1000000).should == "milijun kuna i nula lipa"
  end

  it 'convert 26543864 kuna' do
    NumberToKune.convert(26543864).should == "dvadesetšestmilijunapetstočetrdesettritisućeosamstošezdesetčetiri kune i nula lipa"
  end

  it 'convert 926543864 kuna' do
    NumberToKune.convert(926543864).should == "devetstodvadesetšestmilijunapetstočetrdesettritisućeosamstošezdesetčetiri kune i nula lipa"
  end

  it 'convert 19926543864 kuna' do
    NumberToKune.convert(19926543864).should == "devetnaestmilijardidevetstodvadesetšestmilijunapetstočetrdesettritisućeosamstošezdesetčetiri kune i nula lipa"
  end

  it 'convert 121926543864 kuna' do
    NumberToKune.convert(121926543864).should == "stodvadesetjednamilijardadevetstodvadesetšestmilijunapetstočetrdesettritisućeosamstošezdesetčetiri kune i nula lipa"
  end

end
