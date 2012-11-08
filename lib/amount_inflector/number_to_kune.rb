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
    "1_tisuca" => "jednu", "1_milijun" => "jedan",
    "2" => "dvije", "2_milijun" => "dva",
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
    "21" => "dvadesetjedna", "21_milijun" => "dvadesetjedan",
    "22" => "dvadesetdvije", "22_milijun" => "dvadesetdva",
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

  def translate_to_words(amount, in_words, unit = nil)
    return in_words if amount.nil? || amount.size == 0 || amount.gsub("0","").size == 0
    return '' if amount == "1" && !unit.nil?
    raise "Nisu podrzani iznosi preko bilijun, a poslan je iznos #{amount}" if amount.to_i >= 1_000_000_000_000

    amount = amount.to_i.to_s
    if amount.to_i >= 1000
      decompose(amount, in_words)
    else
      in_words += replaced_word(amount, unit)
      translate_to_words(remove_first_n(amount, replaced_size(amount, unit)), in_words, unit)
    end
  end

  def replaced_word(amount, unit)
    as_word(amount, unit) || as_word(zeroed(amount), unit)
  end

  def replaced_size(amount, unit)
    as_word(amount, unit).nil? ? 1 : amount.size
  end

  def zeroed(amount)
    amount[0] +  "0" * (amount.size - 1)
  end

  def as_word(amount, unit = nil)
    WORDS["#{amount}_#{unit.nil? ? '' : unit}"] || WORDS[amount]
  end

  def remove_first_n(source, n = 1)
    source[n..-1]
  end

  def amount_unit(amount)
    KOEFS.select { |key,value| amount.to_i >= value }.map { |key,value| key }.reverse[0]
  end

  def decompose(amount, in_words)
    unit = amount_unit(amount)
    without_unit = (amount.to_i / KOEFS.fetch(unit)).to_s
    in_words += translate_to_words(without_unit.to_s, '', unit) + AmountInflector.inflect_unit(without_unit.to_i, unit)
    translate_to_words(remove_first_n(amount, without_unit.size), in_words, unit)
  end
end