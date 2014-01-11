require 'optparse'

module Md2Cv
  class CLI 
    def self.run(args)
      options = {}

      puts "#{ARGV.inspect}"
		# set default path for template, can be overridden by -c option
		options[:css] = File.expand_path('./lib/template/')
      optionparser = OptionParser.new do |opts|
        opts.on('-c', '--css CSSDIR', 'Use css files in CSSDIR, not default') do |cssdir|
          options[:css] = cssdir
        end 
      end
      optionparser.parse!(args)

      if File.exists?(ARGV[0]) 
			options[:md] = ARGV[0]
			options[:build] = "build"
			cvgen = Render.new(options)
      	cvgen.run
		else 
      end
      puts "#{options.inspect}"
      puts "#{ARGV.inspect}"
    end
  end
end
