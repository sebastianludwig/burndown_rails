require 'rabl'

Rabl.configure do |config|
  config.include_json_root = true
  config.include_child_root = false
end
