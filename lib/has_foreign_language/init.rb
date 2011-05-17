# Include hook code here

ActiveRecord::Base.send(:include, HasForeignLanguage::I18n)


#ActionView::Helpers::FormHelper.send(:extend, FormFix)