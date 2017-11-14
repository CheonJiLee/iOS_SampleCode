//
//  AutolayoutBasic.m
//  EXAutolayout
//
//  Created by USER on 2017. 11. 14..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "AutolayoutBasic.h"

@implementation AutolayoutBasic

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    self.backgroundColor = UIColor.whiteColor;
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];
    self.backgroundColor = UIColor.redColor;
    
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //    // set vertical
    NSLayoutConstraint *redViewTop = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:20];
    NSLayoutConstraint *redViewBottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeBottom multiplier:1.f constant:20];
    
    NSLayoutConstraint *blueViewTop = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:20];
    NSLayoutConstraint *blueViewBottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.f constant:20];
    
    // set horizontal
    NSLayoutConstraint *redViewleading = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.f constant:20];
    NSLayoutConstraint *redViewWith = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:1.f constant:0];
    
    NSLayoutConstraint *blueViewleading = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeTrailing multiplier:1.f constant:8];
    NSLayoutConstraint *blueViewTrailing = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTrailing multiplier:1.f constant:20];
    
    [self addConstraints:[NSArray arrayWithObjects:redViewTop,redViewBottom,redViewleading,blueViewTrailing,blueViewBottom,blueViewTop, blueViewleading,redViewWith, nil]];
    return self;
}
@end

