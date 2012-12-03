require 'sinatra/base'

module HarmoniousDictionary
  class App < Sinatra::Base
    set :root,   File.dirname(__FILE__) + "/.."
    set :app_file, __FILE__

    post '/segment' do
      @input = params[:input]
      @result = HarmoniousDictionary::Rseg.segment(@input).join(' ')
    end

    post '/seg' do
      @input = params[:input]
      @result = HarmoniousDictionary::Rseg.segment(@input)
    end
  end
end