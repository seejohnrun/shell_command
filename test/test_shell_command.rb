context ShellCommand do

  context 'run' do
    it 'must successfully execute "echo".' do
      command = ShellCommand.run "echo -n Hi!"
      command.success?.must_equal(true)
    end

    it 'must give access to the standard output of "echo"' do
      command = ShellCommand.run "echo -n Hi!"
      command.stdout.must_equal("Hi!")
    end

    it 'must give access to the standard error output of "echo"' do
      command = ShellCommand.run "ls /i_do_not_exist"
      command.stderr.empty?.must_equal(false)
    end

    it 'must call a block, if given.' do
      mock = MiniTest::Mock.new
      mock.expect(:ok, nil)

      ShellCommand.run "ls" do |command|
        mock.ok
      end

      mock.verify
    end

    it "must yield a parameter, if asked." do
      ShellCommand.run "ls" do |command|
        command.must_be_instance_of(ShellCommand::Command)
      end
    end

    it 'must raise a ArgumentError if given no arguments.' do
      proc {
        ShellCommand.run
      }.must_raise(ArgumentError)
    end
  end

end
