require 'rspec'
require "#{File.dirname(__FILE__)}/app"

describe 'Game of life' do
  let(:world) { World.new }
  context 'Cell utility methods' do

    subject { Cell.new(world) }

    it 'Spawn relative to' do
      cell = subject.spawn_at(3,5)
      cell.is_a?(Cell).should be_true
      cell.x.should == 3
      cell.y.should == 5
      cell.world.should == subject.world
    end

    it 'detects a neighbor to the north' do
      cell = subject.spawn_at(0,1)
      subject.neighbors.count.should == 1
    end

    it 'detects a neighbor to the south ' do
      cell = subject.spawn_at(0,-1)
      subject.neighbors.count.should == 1
    end

    it 'dies' do
      subject.die!
      subject.world.cells.should_not include(subject)
    end
  end

  it 'Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population.' do
    cell = Cell.new(world)
    new_cell = cell.spawn_at(2,0)
    cell.neighbors.count.should == 0
    world.tick!
    cell.should be_dead

  end
end
