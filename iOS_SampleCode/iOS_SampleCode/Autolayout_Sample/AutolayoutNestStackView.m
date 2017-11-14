//
//  AutolayoutNestStackView.m
//  EXAutolayout
//
//  Created by USER on 2017. 11. 14..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "AutolayoutNestStackView.h"
@interface AutolayoutNestStackView() <UITextFieldDelegate>
@end

@implementation AutolayoutNestStackView

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    self.backgroundColor = UIColor.whiteColor;
    
    UILabel *firstName = UILabel.new;
    firstName.text = @"First";
    firstName.textAlignment = NSTextAlignmentLeft;
    
    UILabel *middleName = UILabel.new;
    middleName.text = @"Middle";
    middleName.textAlignment = NSTextAlignmentLeft;
    
    UILabel *lastName = UILabel.new;
    lastName.text = @"Last";
    lastName.textAlignment = NSTextAlignmentLeft;
    
    UITextField *firstNameTextField = UITextField.new;
    firstNameTextField.backgroundColor = UIColor.lightGrayColor;
    firstNameTextField.placeholder = @"Enter First Name";
    firstNameTextField.clearButtonMode = UITextFieldViewModeNever;
    firstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    firstNameTextField.delegate = self;
    
    UITextField *middleNameTextField = UITextField.new;
    middleNameTextField.backgroundColor = UIColor.lightGrayColor;
    middleNameTextField.placeholder = @"Enter Middle Name";
    middleNameTextField.clearButtonMode = UITextFieldViewModeNever;
    middleNameTextField.leftViewMode = UITextFieldViewModeAlways;
    middleNameTextField.delegate = self;
    
    UITextField *lastNameTextField = UITextField.new;
    lastNameTextField.backgroundColor = UIColor.lightGrayColor;
    lastNameTextField.placeholder = @"Enter Last Name";
    lastNameTextField.clearButtonMode = UITextFieldViewModeNever;
    lastNameTextField.leftViewMode = UITextFieldViewModeAlways;
    lastNameTextField.delegate = self;
    
    UIImageView *imageView = UIImageView.new;
    imageView.image = [UIImage imageNamed:@"flowers"];
    
    UITextView *textView = UITextView.new;
    textView.backgroundColor = UIColor.darkGrayColor;
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    
    
    UIStackView *firstLabelStackView = [[UIStackView alloc] init];
    firstLabelStackView.axis = UILayoutConstraintAxisHorizontal;
    firstLabelStackView.distribution = UIStackViewDistributionFill;
    firstLabelStackView.translatesAutoresizingMaskIntoConstraints = NO;
    firstLabelStackView.spacing = 8;
    
    [[firstName.widthAnchor constraintEqualToConstant:70] setActive:YES];
    [[firstNameTextField.widthAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    
    [firstLabelStackView addArrangedSubview:firstName];
    [firstLabelStackView addArrangedSubview:firstNameTextField];
    
    UIStackView *middleLabelStackView = [[UIStackView alloc] init];
    middleLabelStackView.axis = UILayoutConstraintAxisHorizontal;
    middleLabelStackView.distribution = UIStackViewDistributionFill;
    middleLabelStackView.translatesAutoresizingMaskIntoConstraints = NO;
    middleLabelStackView.spacing = 8;
    
    [[middleName.widthAnchor constraintEqualToConstant:70] setActive:YES];
    [[middleNameTextField.widthAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    
    [middleLabelStackView addArrangedSubview:middleName];
    [middleLabelStackView addArrangedSubview:middleNameTextField];
    
    UIStackView *lastLabelStackView = [[UIStackView alloc] init];
    lastLabelStackView.axis = UILayoutConstraintAxisHorizontal;
    lastLabelStackView.distribution = UIStackViewDistributionFill;
    lastLabelStackView.translatesAutoresizingMaskIntoConstraints = NO;
    lastLabelStackView.spacing = 8;
    
    [[lastName.widthAnchor constraintEqualToConstant:70] setActive:YES];
    [[lastNameTextField.widthAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    
    [lastLabelStackView addArrangedSubview:lastName];
    [lastLabelStackView addArrangedSubview:lastNameTextField];
    
    UIStackView *labelCollectionStackView = UIStackView.new;
    labelCollectionStackView.axis = UILayoutConstraintAxisVertical;
    labelCollectionStackView.distribution = UIStackViewDistributionFillEqually;
    labelCollectionStackView.translatesAutoresizingMaskIntoConstraints = NO;
    labelCollectionStackView.spacing = 8;
    
    [labelCollectionStackView addArrangedSubview:firstLabelStackView];
    [labelCollectionStackView addArrangedSubview:middleLabelStackView];
    [labelCollectionStackView addArrangedSubview:lastLabelStackView];
    
    UIStackView *imgViewLabelsStackView = UIStackView.new;
    imgViewLabelsStackView.axis = UILayoutConstraintAxisHorizontal;
    imgViewLabelsStackView.distribution = UIStackViewDistributionFill;
    imgViewLabelsStackView.translatesAutoresizingMaskIntoConstraints = NO;
    imgViewLabelsStackView.spacing = 8;
    
    [[imageView.widthAnchor constraintEqualToConstant:70] setActive:YES];
    [[labelCollectionStackView.widthAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    
    [imgViewLabelsStackView addArrangedSubview:imageView];
    [imgViewLabelsStackView addArrangedSubview:labelCollectionStackView];
    
    
    UIStackView *buttonsStackView = UIStackView.new;
    buttonsStackView.axis = UILayoutConstraintAxisHorizontal;
    buttonsStackView.distribution = UIStackViewDistributionFillEqually;
    buttonsStackView.translatesAutoresizingMaskIntoConstraints = NO;
    buttonsStackView.spacing = 8;
    
    [buttonsStackView addArrangedSubview:saveButton];
    [buttonsStackView addArrangedSubview:cancelButton];
    [buttonsStackView addArrangedSubview:clearButton];
    
    
    UIStackView *rootStackView = UIStackView.new;
    rootStackView.axis = UILayoutConstraintAxisVertical;
    rootStackView.distribution = UIStackViewAlignmentFill;
    rootStackView.translatesAutoresizingMaskIntoConstraints = NO;
    rootStackView.spacing = 8;
    [[imgViewLabelsStackView.heightAnchor constraintEqualToConstant:80] setActive:YES];
    [[textView.heightAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    [[buttonsStackView.heightAnchor constraintEqualToConstant:40] setActive:YES];
    
    [rootStackView addArrangedSubview:imgViewLabelsStackView];
    [rootStackView addArrangedSubview:textView];
    [rootStackView addArrangedSubview:buttonsStackView];
    
    [self addSubview:rootStackView];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:rootStackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:20];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:rootStackView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.f constant:20];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:rootStackView attribute:NSLayoutAttributeTrailing multiplier:1.f constant:20];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:rootStackView attribute:NSLayoutAttributeBottom multiplier:1.f constant:20];
    
    [self addConstraints:[NSArray arrayWithObjects:top,leading,trailing,bottom, nil]];
    return self;
}

@end

