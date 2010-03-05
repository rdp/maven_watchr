require 'sane'
require_relative 'maven_watchr.rb'
MavenWatchr.new("mvn test -Dtest=").go_local_dir