# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "exlsx"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Phil Schalm"]
  s.date = "2014-07-10"
  s.description = "Extensions that make it easier/simpler to use axlsx, partiacularily in relation to styling"
  s.files = [".gitignore", "Gemfile", "Rakefile", "exlsx.gemspec", "lib/exlsx.rb", "lib/exlsx/stylesheet/border.rb", "lib/exlsx/stylesheet/fill.rb", "lib/exlsx/stylesheet/font.rb", "lib/exlsx/stylesheet/styles.rb", "lib/exlsx/version.rb", "lib/exlsx/workbook/worksheet/cell.rb", "test.rb"]
  s.homepage = "https://github.com/pnomolos"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Extensions to axlsx"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
