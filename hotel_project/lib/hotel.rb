require_relative "room" #require the room as a relative so that it can be seen in this file

# Hotel.new("hilbert's grand hotel", {"Basement"=>4, "Attic"=>2, "Under the Stairs"=>1})
class Hotel
    def initialize(name, hash) #the hash argument is a hash with room name as k, and capacity as v. Used down below
        @name = name
        @rooms = {} #set rooms to be an empty hash to begin with

        #hash.each do |k,v|. I am defining k,v, to be room_name, capacity because that is aligned with the spec
        hash.each do |room_name, room_instance| #basically, the key is already correct. We just need to fix the value part of it
            @rooms[room_name] = Room.new(room_instance) #instantiating a new Room from the room class. It requires a capacity as an arg, so I am inputting that. The capacity comes from the original value it had in the hash
        end #@rooms above becuase it needs to change the "rooms" hash
    end

    def name
        arr = @name.split(" ")
        arr.map! {|ele| ele.capitalize} #woohoo!
        return arr.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(string)
        # if @rooms.has_key?(string) #rooms is the actual hash
        #     return true
        # else
        #     return false
        # end
        @rooms.has_key?(string)
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person) #if the room does exist, try to add the person
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy? #need to iterate through the room instance
        @rooms.each do |room_name, room_instance|
            if !room_instance.full? #@rooms[room] rather than room because @rooms[room] is the actual instance
                return true
            end
            return false
        end
    end

    def list_rooms
        @rooms.each do |room_name, room_instance|
            puts "#{room_name}: #{room_instance.available_space}"
        end
    end
end
