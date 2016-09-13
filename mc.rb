# require 'sinatra'
require 'sqlite3'
require 'active_record'
require './lib/models'
require './lib/command_runner'

class MC

  def self.get_md_files
    md_path = ENV["MD"] || "./markdown"
    out_path = ENV["OUT"] || "./out"
    [md_path, out_path].each { |path| Dir.mkdir(path) unless Dir.exists?(path) }
    Dir.glob("#{md_path}/**/*.md") 
  end

  def initialize(md_files)
    md_files.each { |file| CommandRunner.process(file) }
  end

  def listen    
  end

end

MC.new(MC.get_md_files).listen
