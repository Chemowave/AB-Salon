//
//  ValidationCheckbox.m
//  abc
//
//  Created by zak-Asim on 5/26/16.
//  Copyright (c) 2016 zak-Asim. All rights reserved.
//

#import "ValidationCheckbox.h"

@implementation ValidationCheckbox
{
    BOOL enableInteraction;

}
@synthesize validImageGreen = _validImageGreen;
@synthesize inValidImage = _inValidImage;
@synthesize validImageYellow = _validImageYellow;
@synthesize emptyImage = _emptyImage;
@synthesize plusImage = _plusImage;
@synthesize imageView = _imageView;


- (void)baseInit {
    _validImageGreen = [UIImage imageNamed:@"validImageGreen"];
    _inValidImage = [UIImage imageNamed:@"inValidImage"];
    _emptyImage = [UIImage imageNamed:@"emptyImage"];
    _validImageYellow = [UIImage imageNamed:@"validImageYellow"];
    _plusImage = [UIImage imageNamed:@"emptyImage"];
    _imageView = [[UIImageView alloc]init];
    [self setImage:validYellow];
    [self addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    enableInteraction = NO;
    
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}


-(void) enableInteractionWithDefaultImage:(enum validationStatus)defaultImage toggledImage:(enum validationStatus)toggledImage{
    enableInteraction = YES;
    self.defaultImage = defaultImage;
    self.toggledImage = toggledImage;
    [self setImage:defaultImage];

}

- (void)layoutSubviews {
    [super layoutSubviews];
        
        CGRect imageFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _imageView.frame = imageFrame;
        [self addSubview:_imageView];
    
}

- (void)setImage:(enum validationStatus )status {
    
    self.currentStatus = status;
    
    switch(status){
        case validGreen:
            _imageView.image = _validImageGreen;
            break;
        case validYellow:
            _imageView.image = _validImageYellow;
            break;
        case invalid:
            _imageView.image = _inValidImage;
            break;
        case empty:
            _imageView.image = _emptyImage;
            break;
        default:
            _imageView.image = _emptyImage;
            break;
    }
    
}



-(void) buttonTapped{
    
    if(enableInteraction)
    {
        if (self.currentStatus == self.defaultImage) {
            [self setImage:self.toggledImage];
        } else {
            [self setImage:self.defaultImage];
        }
    }

}

-(void) setEnabledImage{
    [self setImage:self.defaultImage];
    enableInteraction = YES;
}

-(void) setDisabledImage{
    [self setImage:self.toggledImage];
    enableInteraction = NO;

}





@end
