require 'yaml'

class AmountInflector
  INFLECTIONS_CONFIG = 'app/config/locales/amount_inflections.yml'

  def initialize(amount, unit, inflections=nil)
    @amount = amount
    @unit_inflections = (inflections.nil? ? load_from_yaml_config : inflections)[unit.to_s]
    raise "Inflection :#{unit} is unsupported" if @unit_inflections.nil?
    raise "No default inflection for :#{unit}" if @unit_inflections["default"].nil?
  end

  # first non nil match wins, there is guaranteed to be at least one (default)
  def inflected
    trailing_digits.map { |key| @unit_inflections[key] }.compact[0]
  end

  # for example 211 result is [211,11,1,"default"]
  def trailing_digits
    (amount_length.downto 1).map { |n| @amount % 10**n } << "default"
  end

  def load_from_yaml_config
    YAML::load(File.open(File.expand_path(INFLECTIONS_CONFIG)))
  end

  def to_s() "#@amount #{inflected}" end
  def amount_length() @amount.to_s.length end
end
