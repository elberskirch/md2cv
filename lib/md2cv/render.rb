require "github/markdown"
require "slim"
require "pdfkit"

module Md2Cv
	class Render
	   def initialize(options)
			@md = options[:md]
			@css = options[:css]
		   @build = options[:build]
		end

		def run() 
			html = File.basename(@md, File.extname(@md)) + ".html"
			pdf = File.basename(@md, File.extname(@md)) + ".pdf"
			
			if !File.exists?(@build)
				FileUtils.mkdir @build
			else 
				#cleanup from previous run
				buildfiles = File.join(@build,"*")
				FileUtils.rm buildfiles
			end
			to_html(@md,File.join(@build,html))
			to_pdf(html, File.join(@build,pdf))	
		end

		def to_html (src, out)
			source = File.read(src)

			css = Dir.glob("#{@css}/*.css")
			css.each do |file|
				FileUtils.cp file, @build
			end
			content = add_divs(GitHub::Markdown.render_gfm(source))
			output = render_slim(content)

			File.open(out,'w') {|file| file.puts output}
			puts "#{src} => #{out}"
		end

		# replace text such as [block] with <div class="block">
		def add_divs (html)
			html.gsub!(/^<p>\[(.*?)\/\]/m, '<div class="\1"></div>')
			html.gsub!(/^<p>\[\/(.*?)\]/m, '</div>')
			html.gsub!(/^<p>\[(.*?)\]/m, '<div class="\1">')
			html
		end

		def to_pdf (src, out)
			PDFKit.new(File.new(src), 
						  'lowquality' => true, 'margin-left' => '1.2cm', 
						  'margin-right' => '1.2cm', 'margin-top' => '1.2cm', 'margin-bottom' => '1.2cm').to_file(out)
			puts "#{src} => #{out}"
		end

		def render_slim(content)
			Slim::Template.new(File.join(@css,'base.slim')).render(Object.new, :content => content)
		end

	end
end
