#import "GreetObjC.h"

@implementation GreetObjC

static char *greeting = "hello, Objective-C world!";

- (void)greet
{
    NSLog(@"%s", greeting);
}

@end
