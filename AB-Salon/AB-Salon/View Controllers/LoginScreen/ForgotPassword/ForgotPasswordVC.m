//
//  ForgotPasswordVC.m
//  abc
//
//  Created by zak-Asim on 6/3/16.
//  Copyright © 2016 zak-Asim. All rights reserved.
//

#import "ForgotPasswordVC.h"

@interface ForgotPasswordVC ()<UITextFieldDelegate>
{
    BOOL validEmail;


}
@end

@implementation ForgotPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.btnBottom enableInteraction:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendRequest:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL) validateEmailAddress:(NSString *)checkString{
    
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    
    return [emailTest evaluateWithObject:checkString];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    
    if(textField == self.txtEmailAddress)
    {
        if([self.txtEmailAddress.text length]>70){
            validEmail = NO;
            [self.txtEmailAddress invalidateTextField];
        }
        
        
        
        if([self.txtEmailAddress.text length]>0){
            BOOL valid = [self validateEmailAddress:self.txtEmailAddress.text];
            if(valid){
                
                [self.txtEmailAddress validateTextField];
                validEmail = YES;
                //service call to check if email present and if so then validate and check mark and set bool value for validemail
                
            }else{
                
                //service call to check if email present and if so then validate and check mark and set bool value for validpassword
                
                validEmail = NO;
                
                [self.txtEmailAddress invalidateTextField];
            }
            
        }
        else{
            
            
            [self.txtEmailAddress resetTextfieldStatus];
            
        }
        
    }
    
    
    [self enableDisableSendRequest];
    
}

-(void)enableDisableSendRequest{
    
    if(validEmail)
    {
        [self.btnBottom enableInteraction:YES];
    }else{
        
        [self.btnBottom enableInteraction:NO];
    }
    
    
}



@end
