require 'rails/generators'

class InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_default_inflections
    copy_file 'amount_inflecions.yml', 'app/config/locales/amount_inflections.yml'
  end

end
