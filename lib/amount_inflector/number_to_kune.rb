#encoding:utf-8
class NumberToKune
  def self.convert(amount)
    NumberToKune.new.convert(amount)
  end

  #treba se 'rimovati' na kunu
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

    :desetice =>  [ "", "deset", "dvadeset", "trideset", "četrdeset", "pedeset", "šezdeset",
                "sedamdeset", "osamdeset", "devedeset" ],

    :stotice =>  [ "", "sto", "dvjesto", "tristo", "četiristo", "petsto", "šesto",
               "sedamsto", "osamsto", "devetsto" ]
  }

  def convert(amount)
    ostatak = (amount - amount.to_i).round(2) * 100
    result = "#{raspisi(amount.to_i.to_s, '')} #{AmountInflector.inflect_unit(amount.to_i, :kuna)}"
    result += " i #{raspisi(ostatak.to_s, '')} #{AmountInflector.inflect_unit(ostatak.to_i, :lipa)}"
  end

  private

  def raspisi(kune, slovima, jedinica = nil)
    return slovima if kune.nil? || kune.size == 0 ||  kune.gsub("0","").size == 0
    kune = kune.to_i.to_s
    if kune.to_i < 1000
      if kune.to_i < 23
        slovima += as_word_under_23(kune, jedinica)
        raspisi(take_off(kune, kune.size), slovima, jedinica)
      elsif kune.to_i < 100
        take = [:desetice, kune[0]]
        slovima += as_word(take[0], take[1], jedinica)
        raspisi(take_off(kune, take[1].size), slovima, jedinica)
      elsif kune.to_i < 1_000
        take = [:stotice, kune[0]]
        slovima += as_word(take[0], take[1], jedinica)
        raspisi(take_off(kune, take[1].size), slovima, jedinica)
      end
    elsif kune.to_i < 1_000_000
      razgradi(kune, :tisuca, slovima)
    elsif kune.to_i < 1_000_000_000
      razgradi(kune, :milijun, slovima)
    elsif kune.to_i < 1_000_000_000_000
      razgradi(kune, :milijarda, slovima)
    else
      raise "Nisu podrzani iznosi preko bilijun, a poslan je iznos #{kune}"
    end
  end

  def as_word_under_23(kune, jedinica = nil)
    unless jedinica.nil?
      unless WORDS["#{kune}_#{jedinica}"].nil?
        return WORDS["#{kune}_#{jedinica}"]
      end
    end
    WORDS[kune]
  end

  def as_word(word_key, kune, jedinica = nil)
    word_key = word_key.to_s + "_#{jedinica}" if word_key == :do_dvadeset_tri && !jedinica.nil?
    WORDS[word_key.to_s.to_sym][kune.to_i]
  end

  def take_off(source, number_to_take_off = 1)
    result = source.reverse
    (0...number_to_take_off).each { result.chop! }
    result.reverse
  end

  def razgradi(kune, jedinica, slovima)
    koeficijent = { :tisuca => 1_000, :milijun => 1_000_000, :milijarda => 1_000_000_000 }
    bez = (kune.to_i / koeficijent.fetch(jedinica)).to_s
    slovima += raspisi(bez.to_s, '', jedinica) unless bez == "1"
    slovima += AmountInflector.inflect_unit(bez.to_i, jedinica)
    raspisi(kune[bez.size..kune.size - 1], slovima, jedinica)
  end
end