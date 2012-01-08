class AmountInflector

  AMOUNT_CONFIG = {
     :godina => { one:"godina", few:"godine",  many:"godina" },
     :mjesec => { one:"mjesec", few:"mjeseca", many:"mjeseci" },
     :tjedan => { one:"tjedan", few:"tjedna",  many:"tjedana" },
     :dan =>    { one:"dan",    few:"dana",    many:"dana"}
  }

  def self.inflect(amount, unit)
    unit_inflections = AMOUNT_CONFIG[unit]
    raise "Inflection :#{unit} is unsupported" if unit_inflections.nil?
    "#{amount} #{unit_inflections[pluralize_rule(amount)]}"
  end

  def self.pluralize_rule(n)
    return :many if (11..14).include?(n % 100)
    return :few if (2..4).include?(n % 10)
    (n % 10) == 1 ? :one : :many
  end

end
