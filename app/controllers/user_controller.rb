class UserController < ApplicationController
  def index
    # sql = "Select * from ... your sql query here"
    # records_array = ActiveRecord::Base.connection.execute(sql)
    @users = User.all
  end
end
