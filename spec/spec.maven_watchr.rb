require 'fileutils'
require 'pathname'
require 'spec/autorun'
require 'sane'

require_rel './maven_watchr'

describe MavenWatchr do

  before do
   Dir.chdir 'testArtifactId' if File.exist? 'testArtifactId'
   @subject = MavenWatchr.new
   @subject.stop_after_next = true
  end

  it "should find java test file without .class and compile it "

  it "should run unit test on one" do
    compiled = Pathname('target/test-classes/testGroupId/AppTest.class')
    compiled.delete if compiled.exist?
    Thread.new { @subject.go }
    FileUtils.touch 'src/test/java/testGroupId/AppTest.java'
    sleep 0.1 # should recompile its class
    assert compiled.exist?
       
  end

  it "should run test on all"
  it "should run test compile"

  it "should run test compile on one" do
   pending "figuring out if this is possible"
  end

  it "should use snarl optionally"

end
