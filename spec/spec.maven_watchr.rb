require 'fileutils'
require 'pathname'
require 'spec/autorun'
require 'sane'

require_relative './maven_watchr'

describe MavenWatchr do

  before do
   Dir.chdir 'testArtifactId' if File.exist? 'testArtifactId'
   @subject = MavenWatchr.new
   @subject.stop_after_next = true
   Thread.new { @subject.go_local_dir }  
  end

  it "should find java test file without .class and compile it "

  it "should run unit test on one" do
    compiled = Pathname('target/test-classes/testGroupId/AppTest.class')
    compiled.delete if compiled.exist?
    FileUtils.touch 'src/test/java/testGroupId/AppTest.java'
    sleep 3.1 # should recompile its class
    assert compiled.exist?
       
  end

  it "should run test on all"
  it "should run test compile"

  it "should run test compile on one" do
   pending "figuring out if this is possible"
  end

  it "should use snarl optionally"

end
