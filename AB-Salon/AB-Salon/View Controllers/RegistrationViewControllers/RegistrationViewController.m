//
//  RegistrationViewController.m
//  abc
//
//  Created by zak-Asim on 6/1/16.
//  Copyright (c) 2016 zak-Asim. All rights reserved.
//

#import "RegistrationViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface RegistrationViewController ()
{
    NSInteger maxPageCount;

}
@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    maxPageCount = 5;
    [self.pageControl setNumberOfPages:maxPageCount];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor blackColor]];
    [self.pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
    
    [[self.registerWithFacebook layer] setBorderWidth:1.0f];
    [[self.registerWithFacebook layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[self.registerWithEmail layer] setBorderWidth:1.0f];
    [[self.registerWithEmail layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
}

-(void)swipeRight{
    NSInteger currentPage=[self.pageControl currentPage];
    
    if(currentPage < maxPageCount )
    {
        [self.pageControl setCurrentPage:currentPage+1];
        self.screenNumber.text = [NSString stringWithFormat:@"%li", ([self.pageControl currentPage]+1)];
    }
}

-(void)swipeLeft{
    NSInteger currentPage=[self.pageControl currentPage];
    
   
    
    if(currentPage > 0 )
    {
        [self.pageControl setCurrentPage:currentPage-1];
        self.screenNumber.text = [NSString stringWithFormat:@"%li", ([self.pageControl currentPage]+1)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changePage:(id)sender {
    
    self.screenNumber.text = [NSString stringWithFormat:@"%li", ([self.pageControl currentPage]+1)];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerUsingFb:(id)sender {
}

- (IBAction)registerUsingEmail:(id)sender {
}

@end
