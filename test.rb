#/usr/bin/ruby

require './accessor.rb'
require './segment.rb'
require './programme.rb'

accessor = Accessor.new
programme = accessor.get_programme 'b017l8jv'

if not programme.nil?
    puts "programme.pid:             " + programme.pid
    puts "programme.date:            " + programme.date
    puts "programme.title:           " + programme.title
    puts "programme.sub_title:       " + programme.sub_title
    puts "programme.short_synopsis:  " + programme.short_synopsis
    #puts "programme.medium_synopsis: " + programme.medium_synopsis
    puts "programme.next_pid:        " + programme.next_pid
    puts "programme.previous_pid:    " + programme.previous_pid

    programme.segments.each do |segment|
        puts "  segment..."
    end
end
