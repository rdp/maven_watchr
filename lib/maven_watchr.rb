require 'watchr'
require 'os'

begin
  require 'snarl' if OS.windows?
rescue LoadError
 puts 'snarl gem not available for popups'
end

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
     success = true
     if changed_file[1] =~ /Test$/
       if @command_to_run
         command = @command_to_run + changed_file[1]
         puts command
         success = system(command)
       end
         
     else
      if @command_to_run
        command = @command_to_run + changed_file[1] + 'Test'
        puts command
        success = system(command)
      end
     end
     if OS.windows? && !success
       Snarl.new 'failed:' + command if defined?(Snarl)
     end
      
     raise 'done' if stop_after_next
   
   end
  
   contrl = Watchr::Controller.new(script, Watchr.handler.new)
   contrl.run 
 
    Watchr::Controller.new(script, Watchr.handler.new).run
 end

end