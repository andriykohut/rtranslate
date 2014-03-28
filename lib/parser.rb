require 'optparse'

class Parser
  BANNER = "Usage: ./translate.rb [options] text"
  attr_reader :options
  def initialize
    @options = {}
  end

  def parse
    optparse = OptionParser.new do |opts|
      opts.banner = BANNER

      opts.on('-s', '--sl LANG', 'Source language') do |arg|
        @options[:sl] = arg
      end

      opts.on('-t', '--tl LANG', 'Translate to') do |arg|
        @options[:tl] = arg
      end
    end
    optparse.parse!
    options[:text] = ARGV.join(" ")
  end
end
