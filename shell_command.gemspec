# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "shell_command/version"

Gem::Specification.new do |s|
  s.name        = "shell_command"
  s.version     = ShellCommand::VERSION
  s.authors     = ["Rob Gleeson"]
  s.email       = ["rob@flowof.info"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "shell_command"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"

end
