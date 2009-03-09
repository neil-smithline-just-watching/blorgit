require 'blorgit'
$base = File.dirname(__FILE__)
$blogs = Blog.base_directory
$themes = File.join($base, 'themes')
def themes
  Dir.entries($themes).
    select{ |f| FileTest.directory?(File.join($themes, f)) }.
    reject{ |f| f.match(/^\./) }.each do |theme|
  end
end

# Load theme rake files
Dir[File.join(File.dirname(__FILE__), "themes", "*", "*.rake")].each { |ext| load ext }

desc "return configuration information about the current setup"
task :info do
  puts YAML.dump($config)
  puts "base: #{$base}"
  puts "blog_directory: #{$blogs}"
end

desc "list the available themes"
task :themes do
  themes.each{ |theme| puts theme }
end

desc "create a new blorgit instance"
task :new => [:config, :index]

desc "drop a new default config file into #{File.join($blogs, '.blorgit.yml')}"
task :config do
  config = File.join($blogs, '.blorgit.yml')
  if FileTest.exists?(config)
    puts "A file already exists at #{config}"
    abort
  else
    File.open(config, 'w') {|f| f << YAML.dump({
                                                 'title' => 'Blorgit',
                                                 'index' => 'index',
                                                 'recent' => 0,
                                                 'style' => 'stylesheet.css'
                                              }) }
  end
end

desc "drop a minimal index page into #{File.join($blogs, 'index.org')}"
task :index do
  config = File.join($blogs, 'index.org')
  if FileTest.exists?(config)
    puts "A file already exists at #{config}"
    abort
  else
    File.open(config, 'w') do |f|
      f << <<ORG
#+TITLE:    blorgit
#+OPTIONS: toc:nil ^:nil

blog - org - git

Edit the =index.org= text file in your base directory to change the
contents of this page.

ORG
    end
  end
end
