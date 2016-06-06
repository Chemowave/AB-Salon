//
//  LoginViewController.m
//  abc
//
//  Created by zak-Asim on 6/1/16.
//  Copyright (c) 2016 zak-Asim. All rights reserved.
//

#import "LoginViewController.h"
#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"
//#import "NegotiateAppointmentVC.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    NSString *fbTokenString;
    BOOL validPassword;
    BOOL validEmail;
    
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view.
    [self.loginButton enableInteraction:NO];
    self.facebookView.layer.cornerRadius = 20;
    self.facebookView.clipsToBounds=YES;
    self.errorMessageTopConstraint.constant =-self.lblErrorMsg.frame.size.height;
    
    [self manageLogin];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    //[self manageLogin];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self manageLogin];
}


-(void)manageLogin{

    fbTokenString = [FBSDKAccessToken currentAccessToken].tokenString;
    if ([fbTokenString isEqualToString:@""] || fbTokenString == nil) {
        //stayonpage
        NSLog(@"Not logged in");
    }else{
    
        NSLog(@"Logged in");
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"email"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 //result returns a unique id
             }
         }];
        //[self performSegueWithIdentifier:@"ListViewControllerSegue" sender:nil];
        
      /*  UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"NegotiateAppointmentVCStoryboard" bundle:nil];
        NegotiateAppointmentVC* controller = [storyboard instantiateViewControllerWithIdentifier:@"NegotiateAppointmentVC"];
        
        [self.navigationController pushViewController:controller animated:YES];*/
        //load next page with user data
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    
    if(textField == self.emailAddressTextField)
    {
        if([self.emailAddressTextField.text length]>70){
            validEmail = NO;
            [self.emailAddressTextField invalidateTextField];
        }

        if([self.emailAddressTextField.text length]>0){
            BOOL valid = [self validateEmailAddress:self.emailAddressTextField.text];
            if(valid){
                
                [self.emailAddressTextField validateTextField];
                [self hideError];
                //service call to check if email present and if so then validate and check mark and set bool value for validemail
                
            }else{
                
                //service call to check if email present and if so then validate and check mark and set bool value for validpassword
                
                [self.lblErrorMsg setText:@"invalid email address"];
                [self displayError];
                
                [self.emailAddressTextField invalidateTextField];
            }
            
        }
        else{
            
            [self hideError];
             [self.emailAddressTextField resetTextfieldStatus];
            
        }
        
    }
    if(textField == self.passwordTextField)
    {
        // check if valid password against email using service call and set variable valid password
    }
    
    [self enableDisableLoginButton];
    
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

-(void)displayError{
    
    self.errorMessageTopConstraint.constant = 0;
    [UIView animateWithDuration:0.5
                     animations:^{
                         [self.view layoutIfNeeded]; // Called on parent view
                     }];


}

-(void)hideError{

    self.errorMessageTopConstraint.constant =-self.lblErrorMsg.frame.size.height;
    [UIView animateWithDuration:0.5
                     animations:^{
                         [self.view layoutIfNeeded]; // Called on parent view
                     }];

}

-(void)enableDisableLoginButton{

    if(validPassword && validEmail)
    {
        [self.loginButton enableInteraction:YES];
    }else{
    
        [self.loginButton enableInteraction:NO];
    }


}





- (IBAction)sampleAction:(id)sender {
    
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logInWithReadPermissions:@[@"email"]
                        fromViewController:self
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                      // [self manageLogin];
                                       if(!error){
                                        [self performSegueWithIdentifier:@"ListViewControllerSegue" sender:nil];
                                       }
                                   }];
}
@end
