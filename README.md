__OVERVIEW__


| Project         | shell\_command
|:----------------|:--------------------------------------------------
| Homepage        | https://github.com/robgleeson/shell_command
| Wiki            | https://github.com/robgleeson/shell_command/wiki
| Documentation   | http://rubydoc.info/gems/shell_command/frames
| Author          | Rob Gleeson

__DESCRIPTION__

shell\_command tries to provide a better interface for communicating with
commands you spawn on the shell. The examples will give you a much better idea
of what I mean.

__USE CASES__

* Run a command, and find out if it was successful (e.g: exited with 0).
* Run a command, and access stdout or stderr.

__EXAMPLES__

The first example lets you handle a failure yourself, but the second example
assumes you want a exception raised on failure.

__1.__

    ShellCommand.run "ls" do |command|
      if command.success?
        puts command.stdout
      else
        raise RuntimeError, "The command 'ls' failed."
      end
    end

__2.__

    begin
      ShellCommand.run! "ls"
    rescue ShellCommand::Exception => e
      p e.message
    end

__SUPPORTED PLATFORMS__

JRuby, and Rubinius do not implement `Open3.popen3(…)` properly yet. :(
As soon as they do they will be supported in 1.9 mode.

  * CRuby 1.9+

__LICENSE__

See LICENSE.txt

