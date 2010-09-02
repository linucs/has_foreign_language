class HasForeignLanguageGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :lang, :type => :string, :optional => false, :desc => 'Language identifier'
  argument :name, :type => :string, :optional => true, :desc => 'Model name'
  
  def generate_migration
    if list_of_models.size > 0
      template "migration.rb", "db/migrate/#{Time.now.strftime('%Y%m%d%H%M%S')}_#{migration_name.underscore}.rb"
    else
      puts "No need to migrate!"
    end
  end
  
  private
  
  def list_of_models(force = false)
    all_models = Dir.glob( File.join( Rails.root, 'app', 'models', '*.rb') ).map { |path| path[/.+\/(.+).rb/,1] }
    all_models = all_models.select { |m| m.classify == name } if !name.blank?
    ar_models = all_models.select { |m| m.classify.constantize < ActiveRecord::Base }
    ar_models = ar_models.select { |m| list_of_columns(m, force).length > 0 }
    ar_models
  end
  
  def list_of_columns(model, force = false, log = false)
    c = []
    k = model.classify.constantize
    k.singleton_methods(false).each do |m|
      if m.to_s.match("^has_foreign_language_(.+)\\?$")
        if !k.columns_hash[$1].nil?
          c << k.columns_hash[$1] if !k.columns_hash.has_key? "#{$1}_#{lang.downcase}" || force
        else
          puts "Warning: #{k}##{$1} has not been migrated!" if log
        end
      end
    end
    c
  end
  
  def migration_name
    "AddForeignLanguage#{lang.capitalize}To#{list_of_models.map { |m| m.classify }.join('And')}".slice(0, 127)
  end
end
