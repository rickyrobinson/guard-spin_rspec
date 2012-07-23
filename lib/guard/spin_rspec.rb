require 'guard'
require 'guard/guard'

module Guard
  class SpinRSpec < Guard

    autoload :Runner, 'guard/spin_rspec/runner'
    attr_accessor :runner

    def initialize(watchers=[], options={})
      super
      @options = {
              :all_on_start   => true,
              :spec_paths     => ["spec"],
            }.merge(options)
      @runner = Runner.new(@options)
    end

    def start
      UI.info "Guard::SpinRSpec has started!"
      run_all if @options[:all_on_start]
    end

    def run_all
      UI.info "Guard::SpinRSpec running all specs."
      runner.run_all
    end

    def run_on_changes(paths)
      UI.info "Guard::SpinRSpec running specs for changes."
      runner.run(paths)
    end
    # for guard 1.0.x and earlier
    alias :run_on_change :run_on_changes

  end
end
