#Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show.
#Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key.
#It's up to you to check whether a key currently exists!

class Map
    def initialize
       @map_array = [] 
    end

    def set(key,value)
        index = self.include?(key)
        if index
            @map_array[index] = [key, value]
        else
            @map_array.push([key,value])
        end
    end

    def get(key)
        index = self.include?(key)
        if index
            map_array[index][1]
        else
            puts "THIS ELE DOES NOT EXIST"
            raise
        end
    end

    def delete(key)
        index = self.include?(key)
        if index
            map_array.delete_at(index)
        else
            puts "THIS ELE DOES NOT EXIST"
            raise
        end
    end

    def show
        p map_array
    end
    attr_reader :map_array

    def include?(key)
        @map_array.each_with_index do |subs, i|
           return i if subs[0] == key
        end
        nil
    end
end