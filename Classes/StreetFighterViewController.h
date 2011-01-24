//
//  StreetFighterViewController.h
//  StreetFighter
//
//  Created by Moses DeJong on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVAnimatorView;

@interface StreetFighterViewController : UIViewController {
  AVAnimatorView *m_stanceView;
  AVAnimatorView *m_kickView;
  AVAnimatorView *m_fireballView;
}

@property (nonatomic, retain) AVAnimatorView *stanceView;
@property (nonatomic, retain) AVAnimatorView *kickView;
@property (nonatomic, retain) AVAnimatorView *fireballView;

- (void)animatorAction:(int)action;

- (IBAction) kickAction:(id)sender;
- (IBAction) fireballAction:(id)sender;
- (IBAction) dragonPunchAction:(id)sender;

@end
