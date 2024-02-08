module Admin
  class AdminsController < ApplicationController
    before_action :authenticate_admin!
  
    def index
      # Your code here
    end
  
    def show
      # Your code here
    end
  
    def new
      # Your code here
    end
  
    def create
      # Your code here
    end
  
    def edit
      # Your code here
    end
  
    def update
      # Your code here
    end
  
    def destroy
      # Your code here
    end
  
    private
  
    def authenticate_admin!
      # Your authentication logic here
    end
  end
end