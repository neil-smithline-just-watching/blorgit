#!/usr/bin/env rackup
$global_config ||= YAML.load(File.read(File.join(File.dirname(__FILE__), 'blorgit.yml')))
$blogs_dir  ||= File.expand_path($global_config[:blogs_dir])
$url_prefix ||= $global_config[:url_prefix]
# $no_batch = true # uncomment for color exportation of source code
require File.join(File.dirname(__FILE__), "blorgit")
 
# disable sinatra's auto-application starting
disable :run
 
# we're in dev mode
set :environment, :development

run Sinatra::Application

# To run behind a prefix url
# 
# 1. change the value of $prefix_url above to the value you would like
#    to use (using '/notes' in this example)
# 2. comment out the run line immediately preceding this comment
# 3. un-comment the following Rack map block
# 
# map $url_prefix do
#   run Sinatra::Application
# end
