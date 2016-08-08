module Lunch
	class API < Grape::API
    version 'v1' #, using: :header, vendor: 'lunch'
    format :json
    prefix :api

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end
    end

    resource :menus do
      desc 'Return a list of menus.'
      get do
        Menu.all
      end
    end  

    resource :users do
      desc 'Return a list of users.'
      get do
        User.all
      end
    end  

    resource :orders do
      desc 'Return a list of orders.'
      get do
        Order.all
      end
    end  

	end
end