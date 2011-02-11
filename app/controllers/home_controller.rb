class HomeController < ApplicationController
  
  caches_page :index
  
  def index
    @contacts = [{:name => "Jan Pawlowski", :email => "Jan.Pawlowski@unige.ch"}, {:name => "Daniel Jeanmonod", :email => "Daniel.Jeanmonod@ville-ge.ch"}, {:name => "Jean Mariaux", :email => "Jean.Mariaux@ville-ge.ch"}]
  end

end
