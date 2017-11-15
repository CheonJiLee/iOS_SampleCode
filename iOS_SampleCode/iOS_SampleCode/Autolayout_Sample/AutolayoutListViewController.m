//
//  AutolayoutListViewController.m
//  EXAutolayout
//
//  Created by USER on 2017. 11. 14..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "AutolayoutListViewController.h"
#import "BaseViewController.h"

#import "AutolayoutBasic.h"
#import "AutolayoutThreeButton.h"
#import "AutolayoutStackView.h"
#import "AutolayoutNestStackView.h"
#import "AutolayoutVFL.h"
#import "AutolayoutAnimation.h"

@interface AutolayoutListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tv;
@property (strong, nonatomic) NSArray *sampleAutolayoutVC;
@end


static NSString * const CellReuseIdentifier = @"CellID";

@implementation AutolayoutListViewController

- (instancetype)init {
    self = [super init];
    self.title = @"Sample Code by cjswl";
    if (self) {
        self.sampleAutolayoutVC = @[
                                    [[BaseViewController alloc] initWithTitle:@"Basic"
                                                                    viewClass:AutolayoutBasic.class],
                                    [[BaseViewController alloc] initWithTitle:@"Three Button"
                                                                    viewClass:AutolayoutThreeButton.class],
                                    [[BaseViewController alloc] initWithTitle:@"Stack View"
                                                                    viewClass:AutolayoutStackView.class],
                                    [[BaseViewController alloc] initWithTitle:@"Nest Stack View"
                                                                    viewClass:AutolayoutNestStackView.class],
                                    [[BaseViewController alloc] initWithTitle:@"Visual Format Language"
                                                                    viewClass:AutolayoutVFL.class],
                                    [[BaseViewController alloc] initWithTitle:@"Autolayout Animation"
                                                                    viewClass:AutolayoutAnimation.class]
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
    return self.sampleAutolayoutVC.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewContoller = self.sampleAutolayoutVC[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = viewContoller.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.sampleAutolayoutVC[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}



@end

