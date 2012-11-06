#encoding:utf-8
class NumberToKune
  def self.convert(amount)
    NumberToKune.new.convert(amount)
  end

  WORDS = {
    1 => "jednu",
    2 => "dvije",
    3 => "tri",
    4 => "četiri",
    5 => "pet",
    6 => "šest",
    7 => "sedam",
    8 => "osam",
    9 => "devet",
    10 => "deset",
    11 => "jedanaest",
    12 => "dvanaest",
    13 => "trinaest",
    14 => "četrnaest",
    15 => "petnaest",
    16 => "šestaest",
    17 => "sedamnaest",
    18 => "osamnaest",
    19 => "desetnaest",
    20 => "dvadeset",
    100 => "sto",
    200 => "dvjesto",
    1000 =>  "tisuća",
    1000000 => "milion",
    1000000000 => "milijarda"
  }

  def convert(amount)
    "#{WORDS[amount]} #{AmountInflector.inflect_unit(amount, :kuna)} i nula lipa"
  end

end