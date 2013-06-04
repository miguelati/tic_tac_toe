# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TicTacToe::Application.load_tasks

if %w(staging production).include? Rails.env
  $heroku_deploying = true if File.basename($0) == 'rake' && ARGV.include?('assets:precompile')
end