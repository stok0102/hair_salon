require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require('pg')

# DB = PG.connect({:dbname => 'hair_salon'})

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
  name = params.fetch("client_name")
  client = Client.new({:name => name, :id => nil})
  client.save()
  erb(:success)
end

delete("/client") do
  @client = Client.find(params.fetch("client_id").to_i())
  @client.delete()
  @clients = Client.all()
  erb(:success)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylist_info)
end

get("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @stylists = Stylist.all()
  erb(:client_info)
end

patch("/stylists/:id") do
  stylist_id = params.fetch("id").to_i()
  @stylist = Stylist.find(stylist_id)
  client_ids = params.fetch("client_ids")
  @stylist.update({:client_ids => client_ids})
  @clients = Client.all()
  erb(:stylist_info)
end

patch("/clients/:id") do
  client_id = params.fetch("id").to_i()
  @client = Client.find(client_id)
  stylist_ids = params.fetch("stylist_ids")
  @client.update({:stylist_ids => stylist_ids})
  @stylists = Stylist.all()
  erb(:client_info)
end
