require './config/environment'
require 'rack/rewrite'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run Rack::File.new("public")
use Rack::Static, :root => 'public', :urls => ['/images', '/stylesheets']
use Rack::MethodOverride
run ApplicationController
use EmotionsController
use UsersController
