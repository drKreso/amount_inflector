class AmountInflector
  CONFIG = {
     :godina => { one:"godina", few:"godine",  many:"godina" },
     :mjesec => { one:"mjesec", few:"mjeseca", many:"mjeseci" },
     :tjedan => { one:"tjedan", few:"tjedna",  many:"tjedana" },
     :dan =>    { one:"dan",    few:"dana",    many:"dana" },
     :kuna =>   { one:"kuna",   few:"kune",    many:"kuna" },
     :lipa =>   { one:"lipa",   few:"lipe",    many:"lipa" }
  }

  def self.inflect(amount, unit)
    unit = unit.to_s.to_sym
    raise "Inflection :#{unit} is unsupported" if CONFIG[unit].nil?
    "#{amount} #{CONFIG[unit][pluralize_form(amount)]}"
  end

  def self.inflect_unit(amount, unit)
    unit = unit.to_s.to_sym
    raise "Inflection :#{unit} is unsupported" if CONFIG[unit].nil?
    "#{CONFIG[unit][pluralize_form(amount)]}"
  end


  def self.pluralize_form(n)
    return :many if (11..14).include?(n % 100)
    return :few if (2..4).include?(n % 10)
    (n % 10 == 1) ? :one : :many
  end
end
