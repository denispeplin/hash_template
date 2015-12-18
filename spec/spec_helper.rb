require 'bundler/setup'
Bundler.setup

require 'hash_template'

RSpec.configure do |config|
  config.color = true
  config.order = :random
  Kernel.srand config.seed
end
