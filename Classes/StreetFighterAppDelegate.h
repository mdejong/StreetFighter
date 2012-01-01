//
//  StreetFighterAppDelegate.h
//  StreetFighter
//
//  Created by Moses DeJong on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StreetFighterViewController;

@interface StreetFighterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    StreetFighterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) StreetFighterViewController *viewController;

@end

