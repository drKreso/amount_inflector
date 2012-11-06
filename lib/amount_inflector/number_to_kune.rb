#encoding:utf-8
require 'bigdecimal'

class NumberToKune
  def self.convert(amount)
    NumberToKune.new.convert(amount)
  end

  #needs to 'rhime' on "kuna"
  WORDS = {
    "0" => "nula",
    "1" => "jedna",
    "1_tisuca" => "jednu",
    "1_milijun" => "jedan",
    "2" => "dvije",
    "2_milijun" => "dva",
    "3" => "tri",
    "4" => "četiri",
    "5" => "pet",
    "6" => "šest",
    "7" => "sedam",
    "8" => "osam",
    "9" => "devet",
    "10" => "deset",
    "11" => "jedanaest",
    "12" => "dvanaest",
    "13" => "trinaest",
    "14" => "četrnaest",
    "15" => "petnaest",
    "16" => "šesnaest",
    "17" => "sedamnaest",
    "18" => "osamnaest",
    "19" => "devetnaest",
    "20" => "dvadeset",
    "21" => "dvadesetjedna",
    "21_milijun" => "dvadesetjedan",
    "22" => "dvadesetdvije",
    "22_milijun" => "dvadesetdva",
    "30" => "trideset",
    "40" => "četrdeset",
    "50" => "pedeset",
    "60" => "šezdeset",
    "70" => "sedamdeset",
    "80" => "osamdeset",
    "90" => "devedeset" ,
    "100" => "sto",
    "200" => "dvjesto",
    "300" => "tristo",
    "400" => "četiristo",
    "500" => "petsto",
    "600" => "šesto",
    "700" => "sedamsto",
    "800" => "osamsto",
    "900" => "devetsto"
  }

  KOEFS =
  {
    :tisuca => 1_000,
    :milijun => 1_000_000,
    :milijarda => 1_000_000_000
  }

  def convert(amount)
    return "nula kuna i nula lipa" if BigDecimal.new(amount.to_s) == BigDecimal.new("0.0")

    after_decimal = (amount - amount.to_i).round(2) * 100
    result = "#{translate_to_words(amount.to_i.to_s, '')} #{AmountInflector.inflect_unit(amount.to_i, :kuna)}"
    result += " i #{translate_to_words(after_decimal.to_s, '')} #{AmountInflector.inflect_unit(after_decimal.to_i, :lipa)}"
  end

  private

  def translate_to_words(amount, in_words, unit = nil)
    return in_words if amount.nil? || amount.size == 0 ||  amount.gsub("0","").size == 0

    amount = amount.to_i.to_s
    if amount.to_i < 1000
      if amount.to_i < 1_000
        if as_word(amount, unit) != nil
          in_words += as_word(amount, unit)
          decoded = amount.size
        else
          in_words += as_word(amount[0] +  "0" * (amount.size - 1), unit)
          decoded = 1
        end
        translate_to_words(take_off(amount, decoded), in_words, unit)
      end
    elsif amount.to_i < 1_000_000
      decompose(amount, :tisuca, in_words)
    elsif amount.to_i < 1_000_000_000
      decompose(amount, :milijun, in_words)
    elsif amount.to_i < 1_000_000_000_000
      decompose(amount, :milijarda, in_words)
    else
      raise "Nisu podrzani iznosi preko bilijun, a poslan je iznos #{amount}"
    end
  end

  def as_word(amount, unit = nil)
    (!unit.nil? &&  !WORDS["#{amount}_#{unit}"].nil?) ?  WORDS["#{amount}_#{unit}"] : WORDS[amount]
  end

  def take_off(source, number_to_take_off = 1)
    result = source.reverse
    (0...number_to_take_off).each { result.chop! }
    result.reverse
  end

  def decompose(amount, unit, in_words)
    bez = (amount.to_i / KOEFS.fetch(unit)).to_s
    in_words += translate_to_words(bez.to_s, '', unit) unless bez == "1"
    in_words += AmountInflector.inflect_unit(bez.to_i, unit)
    translate_to_words(amount[bez.size..amount.size - 1], in_words, unit)
  end
end