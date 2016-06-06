//
//  RegistrationViewController.h
//  abc
//
//  Created by zak-Asim on 6/1/16.
//  Copyright (c) 2016 zak-Asim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *screenNumber;
- (IBAction)changePage:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *registerWithFacebook;
@property (weak, nonatomic) IBOutlet UIButton *registerWithEmail;
@property (weak, nonatomic) IBOutlet UIButton *alreadyHaveAccount;
- (IBAction)registerUsingFb:(id)sender;
- (IBAction)registerUsingEmail:(id)sender;


@end
