# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{RFb}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Francesco 'makevoid' Canessa"]
  s.date = %q{2010-02-17}
  s.description = %q{RubyFacebook interacts with Facebook REST API via JSON. No XML to deal with, no parsers needed, reduced verbosity, increased happiness. Ruby1.9 required. Fork it, please!}
  s.email = %q{makevoid@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
     "RFb.gemspec",
     "Rakefile",
     "VERSION",
     "init.rb",
     "lib/r_fb.rb",
     "lib/r_fb/configurable.rb",
     "lib/r_fb/cookie.rb",
     "lib/r_fb/exceptions.rb",
     "lib/r_fb/fql.rb",
     "lib/r_fb/methods.rb",
     "lib/r_fb/parser.rb",
     "lib/r_fb/session.rb",
     "lib/r_fb/user.rb"
  ]
  s.homepage = %q{http://github.com/makevoid/RFb}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{RubyFacebook  - interact with Facebook REST API (json) - rails3 enabled}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

