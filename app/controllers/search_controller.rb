class SearchController < ApplicationController
  
  before_action :authenticate_user!

  
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @records = search_for(@model, @content, @how)
  end
  
  private

  def search_for(model, content, how)
    if model == 'user'
      if how == 'match'
        User.where(name: content)
      elsif how == 'forward'
        User.where('name LIKE ?', content+'%')
      elsif how == 'backward'
        User.where('name LIKE ?', '%'+content )
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
      
    elsif model == 'book'
      if how == 'match'
        Book.where(title: content)
      elsif how == 'forward'
        Book.where('title LIKE ?', content+'%')
      elsif how == 'backward'
        Book.where('title LIKE ?', '%'+content )
      else
        Book.where('title LIKE ?', '%'+content+'%')
      end
      
    end
    
  end
  
end
