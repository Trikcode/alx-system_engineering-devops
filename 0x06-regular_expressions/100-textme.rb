#!/usr/bin/env ruby
sender = ARGV[0].scan(/\[from:(\S*)\]/).join
receiver = ARGV[0].scan(/\[to:(\S*)\]/).join
flags = ARGV[0].scan(/\[flags:(\S*)\]/).join
puts "#{sender},#{receiver},#{flags}"
