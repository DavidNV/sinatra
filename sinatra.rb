require 'sinatra'

enable :sessions

get "/form" do
  if session["name"] && session["last_name"]
    @name = session["name"]
    @last_name = session["last_name"]
    erb :form_response
  else
    @session_closed = session["session_closed"]
    erb :form
  end
end

post "/form_response" do
  @name = params["name"]
  @last_name = params["last_name"]
  session.store("name", @name)
  session.store("last_name", @last_name)

  erb :form_response
end

get "/log_out" do
  session.delete("name")
  session.delete("last_name")
  session.store("session_closed", true)
  redirect "/form"
end

get '/makers/:nombre' do
  @nombre = params["nombre"].capitalize
  erb :index
end

get '/rectangle' do
  width = params["width"].to_i
  heigth = params["heigth"].to_i
  area = width * heigth
  "Rectangle Area: #{area}"
end

get '/square/:side' do
  side = params["side"].to_i
  area = side * side
  "Square Area: #{area}"
end
