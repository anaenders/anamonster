require 'yaml'

class ShowcaseController < ApplicationController

  before_filter :set_section
  
  def index
    @showcase = YAML.load(File.read(Rails.root.join('config', 'showcase.yml')))
  end
  
  protected
  def set_section
    set_current_section(:showcase)
  end


end
