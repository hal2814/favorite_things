#!/usr/bin/env ruby

class Item
  @@list = []
  attr_reader :id
  attr_accessor :name, :rank

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def self.sort
    @@list.sort_by! {|item| item.rank}
  end

  def save()
    @@list.push(self)
  end

  def self.clear()
    @@list = []
  end

  def self.find(id)
    @@list[id - 1]
  end

  def update()
    @@list.each do |item|
      if self == @@list[item]
        @@list[item] = self
        return true
      end
    end
  end

  # def self.find(id)
  #   item_id = id.to_i()
  #   @@list.each do |item|
  #     if item.id == item_id
  #       return item
  #     end
  #   end
  # end
end
