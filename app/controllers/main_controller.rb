class MainController < ApplicationController

  get '/' do
    erb :'index'
  end

  post '/contact' do
    
    options = {
      :to => 'amber.tunnell@gmail.com',
      :from => params[:email],
      :subject => "Notification",
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
    
    redirect '/'

  end

end
