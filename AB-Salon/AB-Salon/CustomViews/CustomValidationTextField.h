//
//  CustomValidationTextField.h
//  abc
//
//  Created by zak-Asim on 6/2/16.
//  Copyright © 2016 zak-Asim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ValidationCheckbox.h"

@interface CustomValidationTextField : UITextField

@property (strong, nonatomic) ValidationCheckbox *validationBox;
-(void) validateTextField;
-(void) invalidateTextField;
-(void) resetTextfieldStatus;

@end
