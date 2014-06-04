class GreetRb < OSX::NSObject
    @@greeting = "hello, Ruby world!"
    
    def greet
        OSX::NSLog(@@greeting)
    end

end