
class MainController < ApplicationController

  get '/' do
    erb :'main/index'
  end

  post '/contact' do
    require 'pony'

    options = {
      :to => 'amber.tunnell@gmail.com',
      :from => params[:first_name] + " " + params[:last_name] + " <" + params[:email] + ">",
      :subject => params[:first_name] + " " + params[:last_name] + " has contacted you",
      :body => params[:message],
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
        }
    }
    
    Pony.mail(options)
    
    # redirect ('/')
  end

end
