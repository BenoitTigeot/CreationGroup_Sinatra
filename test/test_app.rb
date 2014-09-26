ENV['RACK_ENV'] = 'development'
require './bin/app.rb'
require './bin/new_random_groups'
require 'minitest/autorun'
require 'rack/test'
require 'test/unit'
require 'minitest/reporters'
Minitest::Reporters.use!

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_first_page
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('vous de groupe')
  end

  def test_first_page
    get '/numgroup/'
    assert last_response.ok?
    assert last_response.body.include?('Pas de groupe')
  end

  def test_result_group
    post '/numgroup/', params={:numbergroup => 4}
    assert last_response.ok?
    assert last_response.body.include?('groups')
  end
end