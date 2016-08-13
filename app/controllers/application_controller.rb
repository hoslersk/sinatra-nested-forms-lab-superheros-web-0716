require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :super_hero
  end

  post '/teams' do
    #binding.pry
    @team = Team.new(params[:team])
    #binding.pry
      params[:team][:heroes].each do |details|
        Hero.new(details)
      end
      @heroes = Hero.all
    erb :team
  end

# params => {"team"=> {"name"=>"a", "motto"=>"b", "heroes"=>[{"name"=>"c", "power"=>"d", "biography"=>"e"}, {"name"=>"f", "power"=>"g", "biography"=>"h"}, {"name"=>"i", "power" => "j", "biography" => "k"}]}, "submit" => "submit"}

# params[:team] => {"name"=>"a", "motto"=>"b", "heroes"=>[{"name"=>"c", "power"=>"d", "biography"=>"e"}, {"name"=>"f", "power"=>"g", "biography"=>"h"}, {"name"=>"i", "power"=>"j", "biography"=>"k"}]}

# params[:team][:heroes] => [{"name"=>"c", "power"=>"d", "biography"=>"e"}, {"name"=>"f", "power"=>"g", "biography"=>"h"}, {"name"=>"i", "power"=>"j", "biography"=>"k"}]

end
