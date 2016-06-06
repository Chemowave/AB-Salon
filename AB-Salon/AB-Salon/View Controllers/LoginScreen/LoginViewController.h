//
//  LoginViewController.h
//  abc
//
//  Created by zak-Asim on 6/1/16.
//  Copyright (c) 2016 zak-Asim. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <FBSDKLoginKit/FBSDKLoginKit.h>
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "CustomValidationTextField.h"
#import "BottomButton.h"

@interface LoginViewController : UIViewController
- (IBAction)sampleAction:(id)sender;
@property (weak, nonatomic) IBOutlet BottomButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *lblErrorMsg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *errorMessageTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *facebookViewTopSpace;
@property (weak, nonatomic) IBOutlet UIView *facebookView;
//@property (weak, nonatomic) IBOutlet FBSDKLoginButton *facebookRegistrationButton;

@property (weak, nonatomic) IBOutlet CustomValidationTextField *emailAddressTextField;
@property (weak, nonatomic) IBOutlet CustomValidationTextField *passwordTextField;


@end
