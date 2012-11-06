#encoding:utf-8
class NumberToKune
  def self.convert(amount)
    NumberToKune.new.convert(amount)
  end

  WORDS = {
    do_dvadeset_tri: [ "nula", "jedna", "dvije", "tri", "četiri", "pet", "šest", "sedam", "osam", "devet", "deset",
                   "jedanaest", "dvanaest", "trinaest", "četrnaest", "petnaest", "šestaest",
                   "sedamnaest",  "osamnaest", "devetnaest", "dvadeset", "dvadesetjedan", "dvadesetdvije"],

    do_dvadeset_tri_tisuca: [ "nula", "jednu", "dvije", "tri", "četiri", "pet", "šest", "sedam", "osam", "devet", "deset",
                   "jedanaest", "dvanaest", "trinaest", "četrnaest", "petnaest", "šestaest",
                   "sedamnaest",  "osamnaest", "devetnaest", "dvadeset", "dvadesetjedna", "dvadesetdvije"],

    do_dvadeset_tri_milijun: [ "nula", "jedan", "dva", "tri", "četiri", "pet", "šest", "sedam", "osam", "devet", "deset",
                   "jedanaest", "dvanaest", "trinaest", "četrnaest", "petnaest", "šestaest",
                   "sedamnaest",  "osamnaest", "devetnaest", "dvadeset", "dvadesetjedan", "dvadesetdva"],

    do_dvadeset_tri_milijarda: [ "nula", "jedna", "dvije", "tri", "četiri", "pet", "šest", "sedam", "osam", "devet", "deset",
                   "jedanaest", "dvanaest", "trinaest", "četrnaest", "petnaest", "šestaest",
                   "sedamnaest",  "osamnaest", "devetnaest", "dvadeset", "dvadesetjedna", "dvadestdvije"],

    desetice: [ "", "deset", "dvadeset", "trideset", "četrdeset", "pedeset", "šezdeset",
                "sedamdeset", "osamdeset", "devedeset" ],

    stotice: [ "", "sto", "dvjesto", "tristo", "četiristo", "petsto", "šesto",
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
    if kune.to_i < 1000
      if kune.to_i < 23
        take = [:do_dvadeset_tri, kune]
      elsif kune.to_i < 100
        take = [:desetice, kune[0]]
      elsif kune.to_i < 1_000
        take = [:stotice, kune[0]]
      end
      slovima += as_word(take[0], take[1], jedinica)
      raspisi(take_off(kune, take[1].size), slovima, jedinica)
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