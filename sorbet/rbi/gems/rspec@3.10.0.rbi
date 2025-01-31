# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rspec` gem.
# Please instead update this file by running `bin/tapioca sync`.

# typed: true

module RSpec
  extend ::RSpec::Support::Warnings
  extend ::RSpec::Core::Warnings

  class << self
    def clear_examples; end
    def configuration; end
    def configuration=(_arg0); end
    def configure; end
    def const_missing(name); end
    def context(*args, &example_group_block); end
    def current_example; end
    def current_example=(example); end
    def define_context(name, namespace: T.unsafe(nil), ns: T.unsafe(nil), silent: T.unsafe(nil), print_context: T.unsafe(nil), &block); end
    def describe(*args, &example_group_block); end
    def example_group(*args, &example_group_block); end
    def fcontext(*args, &example_group_block); end
    def fdescribe(*args, &example_group_block); end
    def reset; end
    def shared_context(name, *args, &block); end
    def shared_examples(name, *args, &block); end
    def shared_examples_for(name, *args, &block); end
    def world; end
    def world=(_arg0); end
    def xcontext(*args, &example_group_block); end
    def xdescribe(*args, &example_group_block); end
  end
end

RSpec::MODULES_TO_AUTOLOAD = T.let(T.unsafe(nil), Hash)
RSpec::SharedContext = RSpec::Core::SharedContext
module RSpec::Version; end
RSpec::Version::STRING = T.let(T.unsafe(nil), String)
