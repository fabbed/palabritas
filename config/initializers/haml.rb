ActiveSupport.on_load(:action_vew) do
  Haml::Template.options[:format] = :html5
  Haml::Template.options[:ugly] = true
  Haml::Template.options[:attr_wrapper] = '"'
end