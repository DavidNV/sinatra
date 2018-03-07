require 'sinatra'

get '/' do
  @nombre = params["nombre"] ? params["nombre"] : "desconocido"
  erb :index
end
