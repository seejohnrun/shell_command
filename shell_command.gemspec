# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "shell_command/version"

Gem::Specification.new do |s|
  s.name        = "shell_command"
  s.version     = ShellCommand::VERSION
  s.authors     = ["Rob Gleeson"]
  s.email       = ["rob@flowof.info"]
  s.homepage    = "https://github.com/robgleeson/shell_command"

  s.summary     = %q{shell_command tries to provide a better interface for
                     communicating with commands you spawn on the shell}

  s.description = s.summary

  s.rubyforge_project = "shell_command"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = '~> 1.9.1'

  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"

end
