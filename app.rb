require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/item')
require('pry')

get('/') do
  @list = Item.all()
  erb(:input)
end

get('/items/:id') do

  @item = Item.find(params[:id])
  erb(:item)
end

post('/') do
  name = params["name"]
  rank = params["rank"]
  item = Item.new(name, rank)

  if !(item.update())
    item.save()
  end
  @list = Item.sort()
  erb(:list)
end
