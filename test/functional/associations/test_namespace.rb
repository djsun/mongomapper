require 'test_helper'
require 'models'

class NamespaceTest < Test::Unit::TestCase
  def setup
    Hollywood::Movie.collection.clear
    Hollywood::Actor.collection.clear
    Hollywood::Role.collection.clear
  end
  
  context "Hollywood namespace" do
    setup do
      @movie = Hollywood::Movie.create
      @actor = Hollywood::Actor.create
      @role = Hollywood::Role.create(
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
