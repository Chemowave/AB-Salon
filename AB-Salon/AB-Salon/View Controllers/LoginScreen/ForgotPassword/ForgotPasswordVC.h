//
//  ForgotPasswordVC.h
//  abc
//
//  Created by zak-Asim on 6/3/16.
//  Copyright © 2016 zak-Asim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomValidationTextField.h"
#import "BottomButton.h"

@interface ForgotPasswordVC : UIViewController
@property (weak, nonatomic) IBOutlet CustomValidationTextField *txtEmailAddress;
@property (weak, nonatomic) IBOutlet BottomButton *btnBottom;
- (IBAction)sendRequest:(id)sender;

@end
