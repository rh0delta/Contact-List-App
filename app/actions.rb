# Homepage (Root path)
get '/' do
  erb :index
end

get '/views/new_contact' do
  erb :new_contact
end