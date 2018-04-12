class StaticPagesController < ApplicationController
  
  def index
    @tasks = Task.all

    @complete = @tasks.where(done: true).count
    @incomplete = @tasks.where(done: false).count
    
    accomplished = (@complete.to_f / (@complete.to_f + @incomplete.to_f)) * 100
    
    @accomplished = accomplished.to_f.round(0)
  end
end
