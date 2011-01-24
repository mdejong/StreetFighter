//
//  StreetFighterViewController.m
//  StreetFighter
//
//  Created by Moses DeJong on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StreetFighterViewController.h"

#import "AutoPropertyRelease.h"

#import "AVAnimatorView.h"

#import "AVQTAnimationFrameDecoder.h"

#import "AVAppResourceLoader.h"

@implementation StreetFighterViewController

@synthesize stanceView = m_stanceView;
@synthesize kickView = m_kickView;
@synthesize fireballView = m_fireballView;

- (void)makeIndexedAnimationView:(int)index
{
  // The animator view is placed inside the containerView so that the
  // bottom is aligned.
  
  float ratio = 137.0 / 106.0; // ryu stance height at screen size of 320
  //  float ratio = 1.0;
  
  NSString *resourceName;
  int movieWidth;
  int movieHeight;
  // Distance from left edge of movie to center of Ryu's belt
  int movieCenterX;
  
  if (index == 0) {
    // stance
    movieWidth = 50;
    movieHeight = 106;
    movieCenterX = 23;
    resourceName = @"RyuStance.mov";
  } else if (index == 1) {
    // kick
    movieWidth = 116;
    movieHeight = 115;
    movieCenterX = 50;
    resourceName = @"RyuHighKick.mov";    
  } else if (index == 2) {
    // Fireball
    movieWidth = 194;
    movieHeight = 119;
    movieCenterX = 28;
    resourceName = @"RyuFireball.mov";    
  } else {
    assert(0);
  }
  
  int viewWidth = round(movieWidth * ratio);
  int viewHeight = round(movieHeight * ratio);
  int viewCenterX = round(movieCenterX * ratio);
  
  int viewLeftEdgeX = 120;
  int viewMaxY = 290;
  
  int viewX = viewLeftEdgeX - viewCenterX;
  int viewY = viewMaxY - viewHeight;
  
  CGRect frame = CGRectMake(viewX, viewY, viewWidth, viewHeight);
  
  AVAnimatorView *animatorView = [AVAnimatorView aVAnimatorViewWithFrame:frame];
  
  if (index == 0) {
    self.stanceView = animatorView;
  } else if (index == 1) {
    self.kickView = animatorView;
  } else if (index == 2) {
    self.fireballView = animatorView;
  } else {
    assert(0);
  }  
  
  AVAppResourceLoader *resLoader = [AVAppResourceLoader aVAppResourceLoader];
  resLoader.movieFilename = resourceName;
	animatorView.resourceLoader = resLoader;
  
  // Create decoder that will generate frames from Quicktime Animation encoded data
  
  AVQTAnimationFrameDecoder *frameDecoder = [AVQTAnimationFrameDecoder aVQTAnimationFrameDecoder];
	animatorView.frameDecoder = frameDecoder;
  
  //	animatorView.animatorFrameDuration = 1.0;
  animatorView.animatorFrameDuration = 1.0 / 10.0;
  
//	animatorView.animatorRepeatCount = 3;
  
  [self.view addSubview:animatorView];
  
  [animatorView prepareToAnimate];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self makeIndexedAnimationView:0];
  self.stanceView.hidden = TRUE;

  [self makeIndexedAnimationView:1];
//  self.kickView.hidden = TRUE;

  [self makeIndexedAnimationView:2];
//  self.fireballView.hidden = TRUE;
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(animatorDoneNotification:) 
                                               name:AVAnimatorDoneNotification
                                             object:self.stanceView];    

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(animatorDoneNotification:) 
                                               name:AVAnimatorDoneNotification
                                             object:self.kickView];    

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(animatorDoneNotification:) 
                                               name:AVAnimatorDoneNotification
                                             object:self.fireballView];  

  [self animatorAction:0];
}

- (void)animatorAction:(int)action {
  // Stance, Kick, Fireball
  // Note that an action is ignored if an animation other than
  // the stance animation is currently running.

  BOOL isKickAnimating = [self.kickView isAnimatorRunning];
  BOOL isFireballAnimating = [self.fireballView isAnimatorRunning];
  
  if (isKickAnimating || isFireballAnimating) {
    return;
  }

  if ([self.stanceView isAnimatorRunning]) {
    [self.stanceView stopAnimator];
  }
  
  self.stanceView.hidden = TRUE;
  self.kickView.hidden = TRUE;
  self.fireballView.hidden = TRUE;
  
  if (action == 0) {
    // Loop stance animation
    self.stanceView.hidden = FALSE;
    self.stanceView.animatorRepeatCount = 10000;
    [self.stanceView startAnimator];
  } else if (action == 1) {
    // Run kick animation
    self.kickView.hidden = FALSE;
    [self.kickView startAnimator];
  } else if (action == 2) {
    // Run fireball animation
    self.fireballView.hidden = FALSE;
    [self.fireballView startAnimator];
  } else {
//    assert(0);
  }
}

- (void)animatorDoneNotification:(NSNotification*)notification {
	NSLog( @"animatorDoneNotification" );
  [self animatorAction:0];
}

- (IBAction) kickAction:(id)sender
{
  [self animatorAction:1];
}

- (IBAction) fireballAction:(id)sender
{
  [self animatorAction:2];
}

- (IBAction) dragonPunchAction:(id)sender
{
  [self animatorAction:3];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  [AutoPropertyRelease releaseProperties:self thisClass:StreetFighterViewController.class];
  [super dealloc];
}

@end
