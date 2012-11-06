#encoding:utf-8
require 'amount_inflector/number_to_kune.rb'

describe NumberToKune do
  it 'converts to kunas' do
    NumberToKune.convert(21).should == "dvadesetjedna kuna i nula lipa"
    NumberToKune.convert(100).should == "sto kuna i nula lipa"
    NumberToKune.convert(200).should == "dvjesto kuna i nula lipa"
    NumberToKune.convert(200.26).should == "dvjesto kuna i dvadesetšest lipa"
    NumberToKune.convert(1_200.26).should == "tisućudvjesto kuna i dvadesetšest lipa"
    NumberToKune.convert(10).should == "deset kuna i nula lipa"
    NumberToKune.convert(3).should == "tri kune i nula lipa"
    NumberToKune.convert(18).should == "osamnaest kuna i nula lipa"
    NumberToKune.convert(24).should == "dvadesetčetiri kune i nula lipa"
    NumberToKune.convert(27).should == "dvadesetsedam kuna i nula lipa"
    NumberToKune.convert(1000).should == "tisuću kuna i nula lipa"
    NumberToKune.convert(101_000).should == "stojednutisuću kuna i nula lipa"
    NumberToKune.convert(1965).should == "tisućudevetstošezdesetpet kuna i nula lipa"
    NumberToKune.convert(1965.337).should == "tisućudevetstošezdesetpet kuna i tridesetčetiri lipe"
    NumberToKune.convert(9_875).should == "devettisućaosamstosedamdesetpet kuna i nula lipa"
    NumberToKune.convert(18_654).should == "osamnaesttisućašestopedesetčetiri kune i nula lipa"
    NumberToKune.convert(200_0000).should == "dvamilijuna kuna i nula lipa"
    NumberToKune.convert(26_432).should == "dvadesetšesttisućačetiristotridesetdvije kune i nula lipa"
    NumberToKune.convert(97_543).should == "devedesetsedamtisućapetstočetrdesettri kune i nula lipa"
    NumberToKune.convert(197_543).should == "stodevedesetsedamtisućapetstočetrdesettri kune i nula lipa"
    NumberToKune.convert(999_999).should == "devetstodevedesetdevettisućadevetstodevedesetdevet kuna i nula lipa"
    NumberToKune.convert(121_000_000).should == "stodvadesetjedanmilijun kuna i nula lipa"
    NumberToKune.convert(21_000_000_000).should == "dvadesetjednamilijarda kuna i nula lipa"
    NumberToKune.convert(121_000_000_000).should == "stodvadesetjednamilijarda kuna i nula lipa"
    NumberToKune.convert(21_000_000).should == "dvadesetjedanmilijun kuna i nula lipa"
    NumberToKune.convert(1_000_000).should == "milijun kuna i nula lipa"
    NumberToKune.convert(26_543_864).should == "dvadesetšestmilijunapetstočetrdesettritisućeosamstošezdesetčetiri kune i nula lipa"
    NumberToKune.convert(926_543_864).should == "devetstodvadesetšestmilijunapetstočetrdesettritisućeosamstošezdesetčetiri kune i nula lipa"
    NumberToKune.convert(19_926_543_864).should == "devetnaestmilijardidevetstodvadesetšestmilijunapetstočetrdesettritisućeosamstošezdesetčetiri kune i nula lipa"
    NumberToKune.convert(121_926_543_864).should == "stodvadesetjednamilijardadevetstodvadesetšestmilijunapetstočetrdesettritisućeosamstošezdesetčetiri kune i nula lipa"
    NumberToKune.convert(22).should == "dvadesetdvije kune i nula lipa"
    NumberToKune.convert(22_000_000).should == "dvadesetdvamilijuna kuna i nula lipa"
    NumberToKune.convert(0.00).should == "nula kuna i nula lipa"
    NumberToKune.convert(97_543.21).should == "devedesetsedamtisućapetstočetrdesettri kune i dvadestjedna lipa"
  end

end
