//
//  AutolayoutThreeButton.m
//  EXAutolayout
//
//  Created by USER on 2017. 11. 15..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "AutolayoutThreeButton.h"
@interface AutolayoutThreeButton()
@property (strong, nonatomic) UILabel *firstName;
@property (strong, nonatomic) UILabel *middleName;
@property (strong, nonatomic) UILabel *lastName;
@property (strong, nonatomic) UITextField *firstNameTextField;
@property (strong, nonatomic) UITextField *middleNameTextField;
@property (strong, nonatomic) UITextField *lastNameTextField;
@end

@implementation AutolayoutThreeButton

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    self.backgroundColor = UIColor.whiteColor;
    [self configureDisplayItems];
    [self configureAutolayout];
    
    return self;
}


- (void)configureDisplayItems {
    self.firstName = UILabel.new;
    self.firstName.text = @"First";
    self.firstName.textAlignment = NSTextAlignmentLeft;
    self.firstName.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.middleName = UILabel.new;
    self.middleName.text = @"Middle";
    self.middleName.textAlignment = NSTextAlignmentLeft;
    self.middleName.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.lastName = UILabel.new;
    self.lastName.text = @"Last";
    self.lastName.textAlignment = NSTextAlignmentLeft;
    self.lastName.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.firstNameTextField = UITextField.new;
    self.firstNameTextField.backgroundColor = UIColor.lightGrayColor;
    self.firstNameTextField.placeholder = @"Enter First Name";
    self.firstNameTextField.clearButtonMode = UITextFieldViewModeNever;
    self.firstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.firstNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.middleNameTextField = UITextField.new;
    self.middleNameTextField.backgroundColor = UIColor.lightGrayColor;
    self.middleNameTextField.placeholder = @"Enter Middle Name";
    self.middleNameTextField.clearButtonMode = UITextFieldViewModeNever;
    self.middleNameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.middleNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.lastNameTextField = UITextField.new;
    self.lastNameTextField.backgroundColor = UIColor.lightGrayColor;
    self.lastNameTextField.placeholder = @"Enter Last Name";
    self.lastNameTextField.clearButtonMode = UITextFieldViewModeNever;
    self.lastNameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.lastNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.firstName];
    [self addSubview:self.middleName];
    [self addSubview:self.lastName];
    [self addSubview:self.firstNameTextField];
    [self addSubview:self.middleNameTextField];
    [self addSubview:self.lastNameTextField];
}

- (void)configureAutolayout {
    NSLayoutConstraint *firstName_Leading = [NSLayoutConstraint constraintWithItem:self.firstName
                                                                         attribute:NSLayoutAttributeLeading
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self
                                                                         attribute:NSLayoutAttributeLeadingMargin
                                                                        multiplier:1.f
                                                                          constant:0];
    NSLayoutConstraint *middleName_Leading = [NSLayoutConstraint constraintWithItem:self.middleName
                                                                          attribute:NSLayoutAttributeLeading
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeLeadingMargin
                                                                         multiplier:1.f
                                                                           constant:0];
    NSLayoutConstraint *lastName_Leading = [NSLayoutConstraint constraintWithItem:self.lastName
                                                                        attribute:NSLayoutAttributeLeading
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeLeadingMargin
                                                                       multiplier:1.f
                                                                         constant:0];
    NSLayoutConstraint *firstNameTextField_Leading = [NSLayoutConstraint constraintWithItem:self.firstNameTextField
                                                                                  attribute:NSLayoutAttributeLeading
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.firstName
                                                                                  attribute:NSLayoutAttributeTrailing
                                                                                 multiplier:1.f
                                                                                   constant:20];
    NSLayoutConstraint *middleNameTextField_Leading = [NSLayoutConstraint constraintWithItem:self.middleNameTextField
                                                                                   attribute:NSLayoutAttributeLeading
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.middleName
                                                                                   attribute:NSLayoutAttributeTrailing
                                                                                  multiplier:1.f
                                                                                    constant:20];
    NSLayoutConstraint *lastNameTextField_Leading = [NSLayoutConstraint constraintWithItem:self.lastNameTextField
                                                                                 attribute:NSLayoutAttributeLeading
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.lastName
                                                                                 attribute:NSLayoutAttributeTrailing
                                                                                multiplier:1.f
                                                                                  constant:20];
    NSLayoutConstraint *firstNameTextField_Trailing = [NSLayoutConstraint constraintWithItem:self.firstNameTextField
                                                                                   attribute:NSLayoutAttributeTrailing
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self
                                                                                   attribute:NSLayoutAttributeTrailingMargin
                                                                                  multiplier:1.f
                                                                                    constant:0];
    NSLayoutConstraint *middleNameTextField_Trailing = [NSLayoutConstraint constraintWithItem:self.middleNameTextField
                                                                                    attribute:NSLayoutAttributeTrailing
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self
                                                                                    attribute:NSLayoutAttributeTrailingMargin
                                                                                   multiplier:1.f
                                                                                     constant:0];
    NSLayoutConstraint *lastNameTextField_Trailing = [NSLayoutConstraint constraintWithItem:self.lastNameTextField
                                                                                  attribute:NSLayoutAttributeTrailing
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self
                                                                                  attribute:NSLayoutAttributeTrailingMargin
                                                                                 multiplier:1.f
                                                                                   constant:0];
    NSLayoutConstraint *firstName_BaseLine = [NSLayoutConstraint constraintWithItem:self.firstName
                                                                          attribute:NSLayoutAttributeBaseline
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.firstNameTextField
                                                                          attribute:NSLayoutAttributeBaseline
                                                                         multiplier:1.f
                                                                           constant:0];
    NSLayoutConstraint *middleName_BaseLine = [NSLayoutConstraint constraintWithItem:self.middleName
                                                                           attribute:NSLayoutAttributeBaseline
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.middleNameTextField
                                                                           attribute:NSLayoutAttributeBaseline
                                                                          multiplier:1.f
                                                                            constant:0];
    NSLayoutConstraint *lastName_BaseLine = [NSLayoutConstraint constraintWithItem:self.lastName
                                                                         attribute:NSLayoutAttributeBaseline
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.lastNameTextField
                                                                         attribute:NSLayoutAttributeBaseline
                                                                        multiplier:1.f
                                                                          constant:0];
    
    NSLayoutConstraint *firstNameTextField_Width_With_MTF = [NSLayoutConstraint constraintWithItem:self.firstNameTextField
                                                                                         attribute:NSLayoutAttributeWidth
                                                                                         relatedBy:NSLayoutRelationEqual
                                                                                            toItem:self.middleNameTextField
                                                                                         attribute:NSLayoutAttributeWidth
                                                                                        multiplier:1.f
                                                                                          constant:0];
    NSLayoutConstraint *firstNameTextField_Width_With_LTF = [NSLayoutConstraint constraintWithItem:self.firstNameTextField
                                                                                         attribute:NSLayoutAttributeWidth
                                                                                         relatedBy:NSLayoutRelationEqual
                                                                                            toItem:self.lastNameTextField
                                                                                         attribute:NSLayoutAttributeWidth
                                                                                        multiplier:1.f
                                                                                          constant:0];
    NSLayoutConstraint *firstNameTextField_top = [NSLayoutConstraint constraintWithItem:self.firstNameTextField
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.f
                                                                               constant:30];
    
    NSLayoutConstraint *middleNameTextField_top = [NSLayoutConstraint constraintWithItem:self.middleNameTextField
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.firstNameTextField
                                                                               attribute:NSLayoutAttributeBottom
                                                                              multiplier:1.f
                                                                                constant:50];
    NSLayoutConstraint *lastNameTextField_top = [NSLayoutConstraint constraintWithItem:self.lastNameTextField
                                                                             attribute:NSLayoutAttributeTop
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.middleNameTextField
                                                                             attribute:NSLayoutAttributeBottom
                                                                            multiplier:1.f
                                                                              constant:50];
    [self addConstraints:[NSArray arrayWithObjects:
                          firstName_Leading,
                          middleName_Leading,
                          lastName_Leading,
                          firstNameTextField_Leading,
                          middleNameTextField_Leading,
                          lastNameTextField_Leading,
                          firstNameTextField_Trailing,
                          middleNameTextField_Trailing,
                          lastNameTextField_Trailing,
                          firstName_BaseLine,
                          middleName_BaseLine,
                          lastName_BaseLine,
                          firstNameTextField_Width_With_MTF,
                          firstNameTextField_Width_With_LTF,
                          firstNameTextField_top,
                          middleNameTextField_top,
                          lastNameTextField_top, nil]];
}


@end






