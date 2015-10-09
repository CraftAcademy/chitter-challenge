#config.ru
require'./lib/app.rb'

require File.join(File.dirname(__FILE__), './lib/app.rb')

run ChitterApp
