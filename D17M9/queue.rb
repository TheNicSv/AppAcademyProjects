
#Now let's write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and peek.

#Test your code to ensure it follows the principle of FIFO.

class Queue
    def initialize
       @queue_array = [] 
    end

    def enqueue(el)
        @queue_array.push(el)
    end

    def dequeue
        @queue_array.shift
    end

    def peek
        @queue_array.first
    end
end