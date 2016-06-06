//
//  BottomButton.m
//  abc
//
//  Created by zak-Asim on 5/26/16.
//  Copyright (c) 2016 zak-Asim. All rights reserved.
//

#import "BottomButton.h"
#import "QuartzCore/QuartzCore.h"

@implementation BottomButton
{
    
    
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = self.frame.size.height/2;
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.layer.cornerRadius = self.frame.size.height/2;
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.layer.cornerRadius = self.frame.size.height/2;
}
-(void)enableInteraction:(BOOL)value{

   
    self.enabled = value;
    
    if (self.enabled) {
        [self setBackgroundColor:[UIColor colorWithRed:228.0f/256.0f green:154.0f/256.0f blue:41.0f/256.0f alpha:1.0f]];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    } else {
        [self setBackgroundColor:[UIColor colorWithRed:92.0f/256.0f green:91.0f/256.0f blue:106.0f/256.0f alpha:1.0f]];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    }
    


}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
