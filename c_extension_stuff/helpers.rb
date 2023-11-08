# https://blog.appsignal.com/2018/10/30/ruby-magic-building-a-ruby-c-extension-from-scratch.html

module CFromRubyExample
  class Helpers
    def self.string(value)
      "String: '#{value}'"
    end

    def self.number(value)
      value + 1
    end

    def self.boolean(value)
      !value
    end
  end
end
