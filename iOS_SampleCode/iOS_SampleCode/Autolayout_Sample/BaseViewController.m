//
//  BaseViewController.m
//  EXAutolayout
//
//  Created by USER on 2017. 11. 14..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong) Class viewClass;
@end

@implementation BaseViewController

- (id)initWithTitle:(NSString *)title viewClass:(Class)viewClass {
    self = [super init];
    if (self) {
        self.title = title;
        self.viewClass = viewClass;
    }
    return self;
}

- (void)loadView {
    self.view = self.viewClass.new;
    self.view.backgroundColor = UIColor.whiteColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end

