require 'watchr'



class MavenWatchr
 attr_accessor :stop_after_next


 ##
 #  Note that this command will receive a single classname, like App from App.java, appended to it, when it's used
 ##
 def initialize command_to_run
  @command_to_run = command_to_run
 end

 def go_local_dir
   script = Watchr::Script.new
   script.watch('.*/(.*)\.java') do |changed_file|
     if changed_file[1] =~ /^(.*)Test/
       if @command_to_run
         command = @command_to_run + $1
         puts command
         system(command)
       end
         
     else
      if @command_to_run
        command = @command_to_run + changed_file[1]
        puts command
        system(command)
      end
     end
     
     raise 'done' if stop_after_next
   
   end
  
   contrl = Watchr::Controller.new(script, Watchr.handler.new)
   contrl.run 
 
    Watchr::Controller.new(script, Watchr.handler.new).run
 end

end