//
//  AutolayoutVFL.m
//  iOS_SampleCode
//
//  Created by USER on 2017. 11. 14..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "AutolayoutVFL.h"

@implementation AutolayoutVFL

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
    
    NSDictionary *views = @{ @"redView":redView, @"blueView":blueView };
    // set vertical
    NSArray *horizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-8-[blueView(==redView)]-20-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraintRed = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[redView]-20-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraintBlue = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView]-20-|" options:0 metrics:nil views:views];
    
    [NSLayoutConstraint activateConstraints:horizontalConstraint];
    [NSLayoutConstraint activateConstraints:verticalConstraintRed];
    [NSLayoutConstraint activateConstraints:verticalConstraintBlue];
//    [self addConstraints:horizontalConstraint];
//    [self addConstraints:verticalConstraintRed];
//    [self addConstraints:verticalConstraintBlue];
    return self;
}
@end
