class <%= migration_name %> < ActiveRecord::Migration
  
<% list_of_models.each do |model| -%>
  class <%= model.classify %> < ActiveRecord::Base
  end
<% end -%>

  def self.up
<% list_of_models.each do |model| -%>
    change_table(:<%= model.classify.constantize.table_name %>) do |t|
<% list_of_columns(model, false, true).each do |c| -%>
       t.<%= c.type %> :<%= "#{c.name}_#{lang}" %><%= ", :null => #{c.null}" %><%= ", :default => '#{c.default}'" unless c.default.blank? %><%= ", :limit => #{c.limit}" unless c.limit.blank? %><%= ", :sql_type => '#{c.sql_type}'" unless c.sql_type.blank? %><%= ", :precision => #{c.precision}" unless c.precision.blank? %><%= ", :scale => #{c.scale}" unless c.scale.blank? %>
<% end -%>
    end
<% end -%>
end
  
  def self.down
<% list_of_models.each do |model| -%>
<% list_of_columns(model, false).each do |c| -%>
    remove_column :<%= model.classify.constantize.table_name %>, :<%= "#{c.name}_#{lang}" %>
<% end -%><% end -%>
  end
end
