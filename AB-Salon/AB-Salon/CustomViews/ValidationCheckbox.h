//
//  ValidationCheckbox.h
//  abc
//
//  Created by zak-Asim on 5/26/16.
//  Copyright (c) 2016 zak-Asim. All rights reserved.
//

#import <UIKit/UIKit.h>

enum validationStatus { validGreen, validYellow, invalid, empty, plusButton};


@interface ValidationCheckbox : UIButton

@property (strong, nonatomic) UIImage *inValidImage;
@property (strong, nonatomic) UIImage *validImageGreen;
@property (strong, nonatomic) UIImage *validImageYellow;
@property (strong, nonatomic) UIImage *emptyImage;
@property (strong, nonatomic) UIImage *plusImage;
@property (strong, nonatomic) UIImageView * imageView;
@property enum validationStatus currentStatus;
@property enum validationStatus defaultImage;
@property enum validationStatus toggledImage;

- (void)setImage:(enum validationStatus )status;
- (void) enableInteractionWithDefaultImage:(enum validationStatus)defaultImage toggledImage:(enum validationStatus)toggledImage;
-(void) setEnabledImage;
-(void) setDisabledImage;

@end
