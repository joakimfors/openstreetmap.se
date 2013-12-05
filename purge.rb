#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'nesta/env'

Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'
require 'socket'

varnish = '127.0.0.1'
if ARGV[0] then
  varnish = ARGV[0]
end

def purge(path, host, port = 80)
  s = TCPSocket.new host, port

  s.puts 'PURGE ' + path + ' HTTP/1.1'
  s.puts 'Host: openstreetmap.se'
  s.puts ''

  while line = s.gets
    puts line
    if line.strip.empty? then
      break
    end
  end

  s.close
end

Nesta::Page.find_all.each do |page|
  if page.last_modified > Time.now - 3600*48 or true then
    puts 'Purging /' + page.path
    purge('/' + page.path, varnish)
  end
end
