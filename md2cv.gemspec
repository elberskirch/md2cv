# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'md2cv/version'

Gem::Specification.new do |spec|
  spec.name          = "md2cv"
  spec.version       = Md2Cv::VERSION
  spec.authors       = ["Dominik Elberskirch"]
  spec.email         = ["dominik.elberskirch@gmail.com"]
  spec.description   = %q{markdown to cv html/pdf generator}
  spec.summary       = %q{generate html/pdf version of your cv written in markdown}
  spec.homepage      = "https://github.com/elberskirch/md2cv"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "github-markdown"
  spec.add_development_dependency "slim"
  spec.add_development_dependency "pdfkit"
end
