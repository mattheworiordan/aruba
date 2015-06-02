module Aruba
  class ConfigWrapper
    attr_reader :config
    private :config

    def initialize(config)
      @config = config.freeze
    end

    def self.method_missing(name, *args)
      fail ArgumentError, 'Options take no argument' if args.count > 1
      fail UnknownOptionError, %(Option "#{name}" is unknown. Please use only earlier defined options) unless config.key? name

      config[name]
    end
  end
end
