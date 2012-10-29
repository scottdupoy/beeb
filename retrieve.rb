#/usr/bin/ruby

require './accessor.rb'
require './segment.rb'
require './programme.rb'

# test code for now, should pull out latest next value and work from there
ptSeed = 'b019dl7l' # 2012-01-20
emSeed = 'b019dl9z' # 2012-01-21

accessor = Accessor.new
pid = ptSeed
loop do
    programme = accessor.get_programme(pid)
    if programme.segments.count == 0
        break
    end

    # test code for now
    puts programme.pid + ' ' + programme.date + ' ' + programme.segments.count.to_s + ' ' + programme.short_synopsis
    pid = programme.next_pid
    break if pid.nil?
end
