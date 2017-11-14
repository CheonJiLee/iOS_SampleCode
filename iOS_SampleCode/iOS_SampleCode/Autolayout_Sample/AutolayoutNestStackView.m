//
//  AutolayoutNestStackView.m
//  EXAutolayout
//
//  Created by USER on 2017. 11. 14..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "AutolayoutNestStackView.h"
@interface AutolayoutNestStackView() <UITextFieldDelegate>
@property (strong, nonatomic) UILabel *firstName;
@property (strong, nonatomic) UILabel *middleName;
@property (strong, nonatomic) UILabel *lastName;
@property (strong, nonatomic) UITextField *firstNameTextField;
@property (strong, nonatomic) UITextField *middleNameTextField;
@property (strong, nonatomic) UITextField *lastNameTextField;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UIButton *saveButton;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *clearButton;

@property (strong, nonatomic) UIStackView *firstLabelStackView;
@property (strong, nonatomic) UIStackView *middleLabelStackView;
@property (strong, nonatomic) UIStackView *lastLabelStackView;
@property (strong, nonatomic) UIStackView *labelCollectionStackView;
@property (strong, nonatomic) UIStackView *imgViewLabelsStackView;
@property (strong, nonatomic) UIStackView *buttonsStackView;
@property (strong, nonatomic) UIStackView *rootStackView;
@end

@implementation AutolayoutNestStackView

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    self.backgroundColor = UIColor.whiteColor;
    [self configureDisplayItems];
    [self configureNameStackView];
    [self configureImageAndNameStackView];
    [self configureRootStackView];
    
    return self;
}

- (void)configureDisplayItems {
    self.firstName = UILabel.new;
    self.firstName.text = @"First";
    self.firstName.textAlignment = NSTextAlignmentLeft;
    
    self.middleName = UILabel.new;
    self.middleName.text = @"Middle";
    self.middleName.textAlignment = NSTextAlignmentLeft;
    
    self.lastName = UILabel.new;
    self.lastName.text = @"Last";
    self.lastName.textAlignment = NSTextAlignmentLeft;
    
    self.firstNameTextField = UITextField.new;
    self.firstNameTextField.backgroundColor = UIColor.lightGrayColor;
    self.firstNameTextField.placeholder = @"Enter First Name";
    self.firstNameTextField.clearButtonMode = UITextFieldViewModeNever;
    self.firstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    self.middleNameTextField = UITextField.new;
    self.middleNameTextField .backgroundColor = UIColor.lightGrayColor;
    self.middleNameTextField .placeholder = @"Enter Middle Name";
    self.middleNameTextField .clearButtonMode = UITextFieldViewModeNever;
    self.middleNameTextField .leftViewMode = UITextFieldViewModeAlways;
    
    self.lastNameTextField = UITextField.new;
    self.lastNameTextField.backgroundColor = UIColor.lightGrayColor;
    self.lastNameTextField.placeholder = @"Enter Last Name";
    self.lastNameTextField.clearButtonMode = UITextFieldViewModeNever;
    self.lastNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    self.imageView = UIImageView.new;
    self.imageView.image = [UIImage imageNamed:@"flowers"];
    
    self.textView = UITextView.new;
    self.textView.backgroundColor = UIColor.darkGrayColor;
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    
    self.clearButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.clearButton setTitle:@"Clear" forState:UIControlStateNormal];
}

- (void)configureNameStackView
{
    self.firstLabelStackView = [[UIStackView alloc] init];
    self.firstLabelStackView.axis = UILayoutConstraintAxisHorizontal;
    self.firstLabelStackView.distribution = UIStackViewDistributionFill;
    self.firstLabelStackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.firstLabelStackView.spacing = 8;
    
    [[self.firstName.widthAnchor constraintEqualToConstant:70] setActive:YES];
    [[self.firstNameTextField.widthAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    
    [self.firstLabelStackView addArrangedSubview:self.firstName];
    [self.firstLabelStackView addArrangedSubview:self.firstNameTextField];
    
    self.middleLabelStackView = [[UIStackView alloc] init];
    self.middleLabelStackView.axis = UILayoutConstraintAxisHorizontal;
    self.middleLabelStackView.distribution = UIStackViewDistributionFill;
    self.middleLabelStackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.middleLabelStackView.spacing = 8;
    
    [[self.middleName.widthAnchor constraintEqualToConstant:70] setActive:YES];
    [[self.middleNameTextField.widthAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    
    [self.middleLabelStackView addArrangedSubview:self.middleName];
    [self.middleLabelStackView addArrangedSubview:self.middleNameTextField];
    
    self.lastLabelStackView = [[UIStackView alloc] init];
    self.lastLabelStackView.axis = UILayoutConstraintAxisHorizontal;
    self.lastLabelStackView.distribution = UIStackViewDistributionFill;
    self.lastLabelStackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastLabelStackView.spacing = 8;
    
    [[self.lastName.widthAnchor constraintEqualToConstant:70] setActive:YES];
    [[self.lastNameTextField.widthAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    
    [self.lastLabelStackView addArrangedSubview:self.lastName];
    [self.lastLabelStackView addArrangedSubview:self.lastNameTextField];
    
    self.labelCollectionStackView = UIStackView.new;
    self.labelCollectionStackView .axis = UILayoutConstraintAxisVertical;
    self.labelCollectionStackView .distribution = UIStackViewDistributionFillEqually;
    self.labelCollectionStackView .translatesAutoresizingMaskIntoConstraints = NO;
    self.labelCollectionStackView .spacing = 8;
    
    [self.labelCollectionStackView  addArrangedSubview:self.firstLabelStackView];
    [self.labelCollectionStackView  addArrangedSubview:self.middleLabelStackView];
    [self.labelCollectionStackView  addArrangedSubview:self.lastLabelStackView];
}

- (void)configureImageAndNameStackView
{
    self.imgViewLabelsStackView = UIStackView.new;
    self.imgViewLabelsStackView.axis = UILayoutConstraintAxisHorizontal;
    self.imgViewLabelsStackView.distribution = UIStackViewDistributionFill;
    self.imgViewLabelsStackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imgViewLabelsStackView.spacing = 8;
    
    [[self.imageView.widthAnchor constraintEqualToConstant:70] setActive:YES];
    [[self.labelCollectionStackView.widthAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    
    [self.imgViewLabelsStackView addArrangedSubview:self.imageView];
    [self.imgViewLabelsStackView addArrangedSubview:self.labelCollectionStackView];
}

- (void)configureRootStackView
{
    self.buttonsStackView = UIStackView.new;
    self.buttonsStackView.axis = UILayoutConstraintAxisHorizontal;
    self.buttonsStackView.distribution = UIStackViewDistributionFillEqually;
    self.buttonsStackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonsStackView.spacing = 8;
    
    [self.buttonsStackView addArrangedSubview:self.saveButton];
    [self.buttonsStackView addArrangedSubview:self.cancelButton];
    [self.buttonsStackView addArrangedSubview:self.clearButton];
    
    
    self.rootStackView = UIStackView.new;
    self.rootStackView.axis = UILayoutConstraintAxisVertical;
    self.rootStackView.distribution = UIStackViewAlignmentFill;
    self.rootStackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.rootStackView.spacing = 8;
    [[self.imgViewLabelsStackView.heightAnchor constraintEqualToConstant:80] setActive:YES];
    [[self.textView.heightAnchor constraintGreaterThanOrEqualToConstant:0] setActive:YES];
    [[self.buttonsStackView.heightAnchor constraintEqualToConstant:40] setActive:YES];
    
    [self.rootStackView addArrangedSubview:self.imgViewLabelsStackView];
    [self.rootStackView addArrangedSubview:self.textView];
    [self.rootStackView addArrangedSubview:self.buttonsStackView];
    
    [self addSubview:self.rootStackView];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.rootStackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:20];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.rootStackView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.f constant:20];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.rootStackView attribute:NSLayoutAttributeTrailing multiplier:1.f constant:20];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.rootStackView attribute:NSLayoutAttributeBottom multiplier:1.f constant:20];
    
    [self addConstraints:[NSArray arrayWithObjects:top,leading,trailing,bottom, nil]];
}
@end
