//
//  StreetFighterViewController.h
//  StreetFighter
//
//  Created by Moses DeJong on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVAnimatorView;
@class AVAudioPlayer;

@interface StreetFighterViewController : UIViewController {
  AVAnimatorView *m_stanceView;
  AVAnimatorView *m_punchView;
  AVAnimatorView *m_kickView;
  AVAnimatorView *m_fireballView;
  AVAudioPlayer *m_bgAudioPlayer;
  AVAudioPlayer *m_fightPlayer;
}

@property (nonatomic, retain) AVAnimatorView *stanceView;
@property (nonatomic, retain) AVAnimatorView *punchView;
@property (nonatomic, retain) AVAnimatorView *kickView;
@property (nonatomic, retain) AVAnimatorView *fireballView;
@property (nonatomic, retain) AVAudioPlayer *bgAudioPlayer;
@property (nonatomic, retain) AVAudioPlayer *fightPlayer;

- (void)animatorAction:(int)action;

- (IBAction) punchAction:(id)sender;
- (IBAction) kickAction:(id)sender;
- (IBAction) fireballAction:(id)sender;

@end

