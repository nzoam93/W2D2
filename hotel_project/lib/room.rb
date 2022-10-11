class Room #doing a room class to split up the task into two smaller parts
    attr_reader :capacity, :occupants
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        @occupants.length < @capacity ? false : true
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if !full?
            @occupants << name
            return true
        else
            return false
        end
    end

end
