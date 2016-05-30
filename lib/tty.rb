# encoding: utf-8

require 'equatable'
require 'pastel'
require 'tty-cursor'
require 'tty-command'
require 'tty-pager'
require 'tty-platform'
require 'tty-progressbar'
require 'tty-screen'
require 'tty-spinner'
require 'tty-table'
require 'tty-which'

require 'tty/version'
require 'tty/terminal'
require 'tty/system'
require 'tty/vector'
require 'tty/logger'
require 'tty/plugins'
require 'tty/plugins/plugin'
require 'tty/terminal/home'
require 'tty/system/editor'

module TTY

  # Raised when the argument type is different from expected
  class TypeError < ArgumentError; end

  # Raised when the operation is not implemented
  class NoImplementationError < NotImplementedError; end

  # Raised when the passed in validation argument is of wrong type
  class ValidationCoercion < TypeError; end

  # Raised when the attribute is unknown
  class UnknownAttributeError < IndexError; end

  # Raised when command cannot be invoked
  class CommandInvocationError < StandardError; end

  # An empty array used as a default value
  EMPTY_ARRAY = Array.new.freeze

  class << self
    def included(base)
      base.send :extend, ClassMethods
    end
  end

  module ClassMethods
    # Return shared terminal instance
    #
    # @return [TTY::Terminal]
    #
    # @api public
    def terminal
      @terminal ||= Terminal.new
    end

    # Return shared shell instance
    #
    # @return [TTY::Shell]
    #
    # @api public
    # def shell(input=$stdin, output=$stdout)
    #   @shell ||= Shell.new(input, output)
    # end

    # Return shared system object
    #
    # @return [TTY::System]
    #
    # @api public
    def system
      System
    end

    # Return shared plugins instance
    #
    # @return [TTY::Plugins]
    #
    # @api public
    def plugins
      @plugins ||= Plugins.new
    end
  end

  extend ClassMethods
end # TTY
