//  Created by Moses DeJong on 12/01/11.
//  Placed in the public domain.

#import "AutoTimer.h"

@implementation AutoTimer

@synthesize timer = m_timer;

+ (AutoTimer*) autoTimerWithTimeInterval:(NSTimeInterval)seconds
                                  target:(id)target
                                selector:(SEL)aSelector
                                userInfo:(id)userInfo
                                 repeats:(BOOL)repeats
{
  AutoTimer *obj = [[[AutoTimer alloc] init] autorelease];
  
  obj.timer = [NSTimer timerWithTimeInterval:seconds
                                      target:target
                                    selector:aSelector
                                    userInfo:userInfo
                                     repeats:repeats];
  
  [[NSRunLoop currentRunLoop] addTimer:obj.timer forMode: NSDefaultRunLoopMode];
  
  return obj;
}

- (void) dealloc
{
  [self.timer invalidate];
  self.timer = nil;
  [super dealloc];
}

@end
