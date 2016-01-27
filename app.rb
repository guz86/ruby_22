#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about 
end

get '/visit' do
	erb :visit 
end

get '/contacts' do
	erb :contacts
end

post '/visit' do 
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@Hairdresser = params[:hairdresser]

	f = File.open './public/users.txt', 'a'
	f.write "Hairdresser:#{@Hairdresser}, User: #{@username}, phone: #{@phone}, Date and time: #{@datetime}! \n\n"
	f.close

	erb "Thank you! Dear, #{@username} we'll be waiting for you at #{@datetime} Your Hairdresser:#{@Hairdresser}!"
end

post '/contacts' do 
	@email = params[:email]
	@textarea = params[:textarea]
	
	f = File.open './public/contacts.txt', 'a'
	f.write "User: #{@email}, message: #{@textarea}! \n\n"
	f.close

	erb "Thank you! We'll be write anwser on your e-mail: #{@email}!"
end