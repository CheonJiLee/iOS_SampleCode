//
//  AutolayoutAnimation.m
//  EXAutolayout
//
//  Created by USER on 2017. 11. 15..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "AutolayoutAnimation.h"
@interface AutolayoutAnimation()
@property (nonatomic, strong) NSLayoutConstraint *imgView_bottom_highPrior;
@end

// 심슨을 클릭하면 애니메이션 시작.
@implementation AutolayoutAnimation

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"animationImg"];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:imageView];
    
    UIImageView *ballImageView = [[UIImageView alloc] init];
    ballImageView.image = [UIImage imageNamed:@"ball"];
    ballImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:ballImageView];
    
    self.imgView_bottom_highPrior = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.f constant:-30];
    NSLayoutConstraint *imgView_bottom_lowPrior = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.f constant:-200];
    NSLayoutConstraint *imgView_centerX = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0];
    NSLayoutConstraint *imgView_height = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.3f constant:0];
    NSLayoutConstraint *imgView_width = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeHeight multiplier:0.5f constant:0];
    imgView_bottom_lowPrior.priority = UILayoutPriorityDefaultHigh;
    
    
    NSLayoutConstraint *ballImgView_centerY = [NSLayoutConstraint constraintWithItem:ballImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0];
    ballImgView_centerY.priority = UILayoutPriorityDefaultLow;
    NSLayoutConstraint *ballImageView_centerX = [NSLayoutConstraint constraintWithItem:ballImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0];
    NSLayoutConstraint *ballImageView_width = [NSLayoutConstraint constraintWithItem:ballImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeWidth multiplier:0.5f constant:0];
    NSLayoutConstraint *ballImageView_height = [NSLayoutConstraint constraintWithItem:ballImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:ballImageView attribute:NSLayoutAttributeWidth multiplier:1.f constant:0];
    
    NSLayoutConstraint *imageAndBallSpacingY = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:ballImageView attribute:NSLayoutAttributeBottom multiplier:1.f constant:20];
    
    
    //    NSLayoutConstraint *imgView_width = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.f constant:100];
    //    NSLayoutConstraint *imgView_height = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeWidth multiplier:2.f constant:0];
    //    [[imageView.widthAnchor constraintEqualToConstant:100] setActive:YES];
    //    [[imageView.heightAnchor constraintEqualToConstant:200] setActive:YES];
    
    [self addConstraints:[NSArray arrayWithObjects:self.imgView_bottom_highPrior,imgView_bottom_lowPrior, imgView_centerX, imgView_height, nil]];
    [imageView addConstraints:[NSArray arrayWithObjects:imgView_width, nil]];
    
    [self addConstraints:[NSArray arrayWithObjects:ballImageView_centerX, ballImgView_centerY, ballImageView_width, imageAndBallSpacingY, nil]];
    [ballImageView addConstraint:ballImageView_height];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    singleTap.numberOfTapsRequired = 1;
    [imageView setUserInteractionEnabled:YES];
    [imageView addGestureRecognizer:singleTap];
    
    
    return self;
}

- (void)tapAction{
    NSLog(@"single Tap on imageview");
    if (self.imgView_bottom_highPrior.active) {
        [UIView animateWithDuration:1 animations:^{
            self.imgView_bottom_highPrior.active = NO;
            [self layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:1 animations:^{
            self.imgView_bottom_highPrior.active = YES;
            [self layoutIfNeeded];
        }];
    }
}


@end

