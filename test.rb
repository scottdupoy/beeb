#/usr/bin/ruby

require './accessor.rb'
require './segment.rb'
require './programme.rb'

accessor = Accessor.new
programme = accessor.get_programme 'b01hjbtc'

if not programme.nil?
    puts "programme.pid:             " + programme.pid
    puts "programme.date:            " + programme.date
    puts "programme.title:           " + programme.title
    puts "programme.sub_title:       " + programme.sub_title
    puts "programme.short_synopsis:  " + programme.short_synopsis
    #puts "programme.medium_synopsis: " + programme.medium_synopsis
    puts "programme.next_pid:        " + programme.next_pid
    puts "programme.previous_pid:    " + programme.previous_pid
    puts

    programme.segments.each do |segment|
        puts "  segment"
        if not segment.segment_title.nil?
            puts "    segment_title: " + segment.segment_title
        end
        puts "    position:      " + segment.position.to_s
        puts "    artist:        " + segment.artist
        puts "    title:         " + segment.title
        puts "    record_label:  " + (segment.record_label.nil? ? "Unknown" : segment.record_label)
        puts
    end
end
