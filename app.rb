require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require('pg')
require("pry")

DB = PG.connect({:dbname => 'hair_salon_test'})

get("/") do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

post("/stylists") do
  name = params.fetch("stylist_name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:success)
end

delete("/stylist") do
  @stylist = Stylist.find(params.fetch("stylist_id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:success)
end

post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id")
  client = Client.new({:name => name, :stylist_id => stylist_id, :id => nil})
  client.save()
  erb(:success)
end

delete("/client") do
  @client = Client.find(params.fetch("remove_client_id").to_i())
  @client.delete()
  @clients = Client.all()
  erb(:success)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylist)
end

patch("/stylists/:id") do
  stylist = Stylist.find(params.fetch("id").to_i())
  name = params.fetch("new_name")
  stylist.update({:name => name})
  erb(:success)
end

patch("/client") do
  @client = Client.find(params.fetch("rename_client_id").to_i())
  name = params.fetch("new_client_name")
  @client.update({:name => name})
  @clients = Client.all()
  erb(:success)
end
