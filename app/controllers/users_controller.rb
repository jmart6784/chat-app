class UsersController < ApplicationController
  def index
    if params[:search]
      search_txt = params[:search].downcase
      @users = []

      search_words = search_txt.split(" ")
      
      User.all.select do |user|
        next if current_user === user

        search_words.each do |word|
          if user.first_name.downcase[word] || user.last_name.downcase[word] || user.username.downcase[word]
            @users << user
          end
        end
      end

      @users.uniq!
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
