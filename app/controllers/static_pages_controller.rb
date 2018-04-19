class StaticPagesController < ApplicationController
  
  def index
    @tasks = Task.all

    @complete = @tasks.where(done: true).count
    @incomplete = @tasks.where(done: false).count
    
    if @tasks.count != 0
    accomplished = (@complete / (@tasks.count)) * 100
    @accomplished = accomplished.to_f.round(0)
    end
  end
end
