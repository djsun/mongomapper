require 'test_helper'
require 'models'

class NamespaceTest < Test::Unit::TestCase
  include Hollywood

  def setup
    Movie.collection.clear
    Actor.collection.clear
    Role.collection.clear
  end
  
  context "Hollywood namespace" do
    setup do
      @movie = Movie.create
      @actor = Actor.create
      @role = Role.create(
        :movie_id => @movie.id,
        :actor_id => @actor.id
      )
    end

    should "belongs_to associations" do
      @role.actor.should == @actor
      @role.movie.should == @movie
    end

    should "has_many associations" do
      @movie.roles.should == [@role]
      @actor.roles.should == [@role]
    end
  end
end
