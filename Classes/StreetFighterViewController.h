//
//  StreetFighterViewController.h
//  StreetFighter
//
//  Created by Moses DeJong on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVAnimatorView;
@class AVAnimatorMedia;
@class AVAudioPlayer;

@interface StreetFighterViewController : UIViewController {
  AVAnimatorView *m_renderView;
  
  AVAnimatorMedia *m_stanceMedia;
  AVAnimatorMedia *m_punchMedia;
  AVAnimatorMedia *m_kickMedia;
  AVAnimatorMedia *m_fireballMedia;

  CGRect stanceFrame;
  CGRect punchFrame;
  CGRect kickFrame;
  CGRect fireballFrame;
  
  AVAudioPlayer *m_bgAudioPlayer;
  AVAudioPlayer *m_fightPlayer;
}

@property (nonatomic, retain) AVAnimatorView *renderView;

@property (nonatomic, retain) AVAnimatorMedia *stanceMedia;
@property (nonatomic, retain) AVAnimatorMedia *punchMedia;
@property (nonatomic, retain) AVAnimatorMedia *kickMedia;
@property (nonatomic, retain) AVAnimatorMedia *fireballMedia;

@property (nonatomic, retain) AVAudioPlayer *bgAudioPlayer;
@property (nonatomic, retain) AVAudioPlayer *fightPlayer;

- (void)animatorAction:(int)action;

- (IBAction) punchAction:(id)sender;
- (IBAction) kickAction:(id)sender;
- (IBAction) fireballAction:(id)sender;

@end

