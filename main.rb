require 'sinatra'
require 'sinatra/contrib/all'
require 'json'
require 'pg'
require 'pry-byebug'


get '/' do
  redirect to('/index')
end

get '/index' do
  @title_of_page = "index"
  # send back all videos in the DB to script.js
  sql = 'SELECT * FROM videos'
  @item = run_sql(sql)
  if  request.xhr?
    json @item.entries
  else
    erb :index
  end
end

get '/index/new' do
  @title_of_page = "new tube"


end

get '/index/:id' do
  @title_of_page = "show tube"
  sql = "SELECT * FROM videos where id = '#{params[:id]}'"
  run_sql(sql)
  if  request.xhr?
    json @item.entries
  else
    erb index
  end
end


private
def run_sql(sql)
  conn = PG.connect(:dbname =>'memetube_AJAX', :host => 'localhost')
  begin
    result = conn.exec(sql)
  ensure
    conn.close
  end

  result
end