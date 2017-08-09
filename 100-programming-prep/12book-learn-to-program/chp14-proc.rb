# # Better Profile

# $OPT_PROFILING_ON = false

# def profile block_description, &block
#   if $OPT_PROFILING_ON
#     start_time = Time.new
#     block[]
#     duration = Time.new - start_time
#     puts "#{block_description}: #{duration} seconds"
#   else
#     block[]
#   end
# end

# # Grandfather clock

# def grandfather_clock &block
#   hour = Time.new.hour
#   hour = hour % 12

#   if hour == 0
#     hour = 12
#   end

#   hour.times do
#     block.call
#   end

# end

# grandfather_clock do
#   puts "Dung!"
# end

# def grandfather_clock &block
#   hour = (Time.new.hour + 11) % 12 + 1

#   hour.times(&block)
# end

# grandfather_clock {puts 'Dung!'}

# # Program Logger

def log block_description, &block
  puts "Beginning \"#{block_description}\"..."
  block_return = block.call
  puts "...\"#{block_description}\" finished, returning:"
end

log "outer block" do

end