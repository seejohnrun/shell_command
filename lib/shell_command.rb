require "shell_command/version"
require 'open3'

module ShellCommand

  class Exception < StandardError
  end

  #
  # @attr [Process::Status] status
  #   The status of the command.
  #
  # @attr [String] stderr
  #   The output written by the command to standard error.
  #
  # @attr [String] stdout
  #   The output written by the command to standard output.
  #
  class Command < Struct.new(:status, :stderr, :stdout)

    def method_missing method, *args, &block
      if status.respond_to?(method)
        status.send(method, *args, &block)
      else
        super
      end
    end

    def respond_to_missing? method, include_private = false
      status.respond_to?(method, include_private)
    end

  end

  #
  # @example
  #
  #   ShellCommand.run "ls" do |command|
  #     if command.success?
  #       # …
  #     else
  #       raise RuntimeError, 'Command "ls" failed.'
  #     end
  #   end
  #
  # @param [String] *args
  #   A command and its arguments to execute (if any).
  #
  # @yieldparam [ShellCommand::Command] command
  #   Yields {ShellCommand::Command} if a block is given.
  #
  # @return [ShellCommand::Command]
  #   Returns a {ShellCommand::Command}
  #
  def run *args
    if args.empty?
      raise ArgumentError, 'Wrong number of arguments (0 for 1)'
    end

    Open3.popen3(*args) do |_, stdout, stderr, thr|
      status  = thr.value
      command = Command.new(status, stderr.read, stdout.read)

      if block_given?
        yield(command)
      else
        command
      end
    end
  end
  module_function :run

  #
  # @param 
  #   (see #run)
  #
  # @raise [ShellCommand::Exception]
  #   If the command is unsuccessful (e.g: > 0 exit status code) 
  #
  # @return 
  #   (see #run)
  #
  def run! *args
    command = run(*args)

    if command.success?
      command
    else
      raise ShellCommand::Exception,
            "The command '#{args.join(' ')}' has failed."
    end
  end
  module_function :run!

end

