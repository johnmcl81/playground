ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
load "#{Rails.root}/db/seeds.rb"

class ActiveSupport::TestCase

end
