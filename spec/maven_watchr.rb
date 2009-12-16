require 'watchr'



class MavenWatchr
 attr_accessor :stop_after_next
 def go
    Watchr::Controller.new(Watchr::Script.new(absolute_path), Watchr.handler.new).run
 end

end