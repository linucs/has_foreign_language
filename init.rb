# Include hook code here
require 'has_foreign_language'
require 'form_fix'
ActiveRecord::Base.send(:include, HasForeignLanguage)
#ActionView::Helpers::FormHelper.send(:extend, FormFix)