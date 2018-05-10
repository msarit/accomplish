class Task < ApplicationRecord
  def self.counts
    {
      done: Task.where(done: true).count,
      not_done: Task.where(done: false).count
    }
  end
end
