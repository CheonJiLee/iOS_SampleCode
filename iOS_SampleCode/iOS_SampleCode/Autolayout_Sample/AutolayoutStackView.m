//
//  AutolayoutStackView.m
//  EXAutolayout
//
//  Created by USER on 2017. 11. 14..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "AutolayoutStackView.h"

@implementation AutolayoutStackView

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    self.backgroundColor = UIColor.whiteColor;
    
    UILabel *flowersLabel = UILabel.new;
    flowersLabel.text = @"Flowers";
    flowersLabel.textAlignment = NSTextAlignmentCenter;
    
    UIImageView *imageView = UIImageView.new;
    imageView.image = [UIImage imageNamed:@"flowers"];
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [editButton setTitle:@"Edit" forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFill;
    //    stackView.backgroundColor = UIColor.lightGrayColor;
    
    [[flowersLabel.heightAnchor constraintEqualToConstant:70] setActive:YES];
    [[imageView.heightAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    [[editButton.heightAnchor constraintEqualToConstant:70] setActive:YES];
    
    [stackView addArrangedSubview:flowersLabel];
    [stackView addArrangedSubview:imageView];
    [stackView addArrangedSubview:editButton];
    
    [self addSubview:stackView];
    
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:stackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:20];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:stackView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.f constant:20];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:stackView attribute:NSLayoutAttributeTrailing multiplier:1.f constant:20];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:stackView attribute:NSLayoutAttributeBottom multiplier:1.f constant:20];
    
    [self addConstraints:[NSArray arrayWithObjects:top,leading,trailing,bottom, nil]];
    return self;
}

- (void)editAction {
    NSLog(@"Edit Edit");
}
@end

