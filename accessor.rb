require 'net/http'
require 'json'

class Accessor

    def get_programme pid
        json = download_json 'http://www.bbc.co.uk/programmes/' + pid + '.json'
        if json.nil?
            puts "ERROR: could not download json for " + pid
            return nil
        end
        
        data = json["programme"]
        programme = Programme.new
        programme.pid = data["pid"]
        programme.previous_pid = data["peers"]["previous"]["pid"]
        programme.next_pid = data["peers"]["next"]["pid"]
        programme.title = data["display_title"]["title"]
        programme.sub_title = data["display_title"]["subtitle"]
        programme.short_synopsis = data["short_synopsis"]
        programme.medium_synopsis = data["medium_synopsis"]
        programme.date = data["first_broadcast_date"][0, 10]
        programme.segments = get_segments pid

        return programme
    end
    
private

    def get_segments pid
    
        json = download_json 'http://www.bbc.co.uk/programmes/' + pid + '/segments.json'

        #todo

        return Array.new
    end

    def download_json url
        count = 0
        current_url = url
        while count < 5
            response = get_response(current_url)
            if response.kind_of? Net::HTTPOK
                return JSON.parse response.body            
            elsif response.kind_of? Net::HTTPRedirection
                current_url = response['location']
                puts "WARN: Redirecting to " + current_url
            else
                puts "ERROR: problem downloading url"
                puts "  url:  " + url
                puts "  code: " + response.code
                puts "  body: " + response.body
                return nil
            end
            count += 1
        end
        puts "ERROR: too many redirections while downloading url"
        puts "  url:  " + url
        return nil
    end
    
    def get_response url
        uri = URI(url)
        Net::HTTP.get_response(uri)
    end

end
