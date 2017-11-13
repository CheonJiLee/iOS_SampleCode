//
//  SampleListViewController.m
//  EXURLSession2
//
//  Created by USER on 2017. 11. 13..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "SampleListViewController.h"
#import "CJURLSessionViewcontroller.h"

@interface SampleListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tv;
@property (strong, nonatomic) NSArray *sampleControllers;
@end

static NSString * const CellReuseIdentifier = @"CellID";
@implementation SampleListViewController

- (instancetype)init {
    self = [super init];
    self.title = @"Sample Code by cjswl";
    if (self) {
        self.sampleControllers = @[
                                   [[CJURLSessionViewcontroller alloc] init]
                                   ];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self configureTableView];
}

- (void)configureTableView {
    self.tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tv.delegate = self;
    self.tv.dataSource = self;
    self.tv.backgroundColor = [UIColor lightGrayColor];
    [self.tv registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    self.tv.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tv];
    [self.tv reloadData];
}


#pragma mark - TabelView dataSource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sampleControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    if([[self.sampleControllers objectAtIndex:indexPath.row] isKindOfClass:[CJURLSessionViewcontroller class]])
    {
        cell.textLabel.text = @"NSURLSession Sample";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[self.sampleControllers objectAtIndex:indexPath.row] animated:YES];
}



@end

