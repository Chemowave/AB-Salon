//
//  CustomValidationTextField.m
//  abc
//
//  Created by zak-Asim on 6/2/16.
//  Copyright © 2016 zak-Asim. All rights reserved.
//

#import "CustomValidationTextField.h"

@implementation CustomValidationTextField


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UILabel * leftLabel =[[UILabel alloc]initWithFrame:CGRectMake(0,0,30,26)];
    leftLabel.backgroundColor = [UIColor clearColor];
    self.leftView = leftLabel;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth=1.0;
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = self.bounds.size.height/2;
    
    
    UILabel * rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 30,0,30,20)];
    rightLabel.backgroundColor = [UIColor clearColor];
    self.rightView = rightLabel;
    self.rightViewMode = UITextFieldViewModeAlways;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    self.validationBox = [[ValidationCheckbox alloc] initWithFrame:CGRectMake(0,0,20,20)];
    [self.validationBox setImage:empty];
    [self setTextColor:[UIColor whiteColor]];
    
    [rightLabel addSubview:self.validationBox];
    
    
}

-(void) validateTextField{
    
    [self.validationBox setImage:validYellow];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;



}
-(void) invalidateTextField{
    [self.validationBox setImage:invalid];
    self.layer.borderColor = [UIColor redColor].CGColor;



}

-(void) resetTextfieldStatus{
    [self.validationBox setImage:empty];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    
}





@end
