class Task < ApplicationRecord
  def self.counts
    {
      completed: Task.where(done: true).count,
      incomplete: Task.where(done: false).count
    }
  end
end
