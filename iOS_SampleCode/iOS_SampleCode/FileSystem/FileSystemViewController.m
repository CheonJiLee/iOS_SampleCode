//
//  FileSystemViewController.m
//  iOS_SampleCode
//
//  Created by USER on 2017. 11. 16..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "FileSystemViewController.h"

@implementation UIButton (conveience)
+ (UIButton *)getButtonObject:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.borderColor = UIColor.darkGrayColor.CGColor;
    button.layer.borderWidth = 2;
    return button;
}
@end

@interface FileSystemViewController()
@property (nonatomic, strong) UIButton *dirCreateButton;
@property (nonatomic, strong) UIButton *dirMoveButton;
@property (nonatomic, strong) UIButton *dirRemoveButton;
@property (nonatomic, strong) UIButton *showListInDirButton;

@property (nonatomic, strong) UIButton *fileCreateButton;
@property (nonatomic, strong) UIButton *fileReadButton;
@property (nonatomic, strong) UIButton *fileMoveButton;
@property (nonatomic, strong) UIButton *fileRemoveButton;
@property (nonatomic, strong) UIButton *fileCopyButton;
@property (nonatomic, strong) UIButton *fileEqualButton;

@property (nonatomic, strong) UILabel *pathLabel;
@property (nonatomic, strong) UILabel *resultLabel;

@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) NSArray *dirPath;
@property (nonatomic, strong) NSString *documentPath;
@property (nonatomic, strong) NSString *currentPath;
@end

@implementation FileSystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self buttonCofigure];
    [self labelConfigure];
    [self autolayoutConfigure];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.fileManager = [NSFileManager defaultManager];
    self.dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    self.documentPath = [self.dirPath objectAtIndex:0];
    self.currentPath = self.documentPath;
}

- (void)buttonCofigure {
    
    self.dirCreateButton = [UIButton getButtonObject:@"Directory Create"];
    [self.dirCreateButton addTarget:self action:@selector(dirCreateAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dirCreateButton];
    
    self.dirMoveButton = [UIButton getButtonObject:@"Directory Move"];
    [self.dirMoveButton addTarget:self action:@selector(dirMoveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dirMoveButton];
    
    self.dirRemoveButton = [UIButton getButtonObject:@"Directory Remove"];
    [self.dirRemoveButton addTarget:self action:@selector(dirRemoveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dirRemoveButton];
    
    self.showListInDirButton = [UIButton getButtonObject:@"Directory showList"];
    [self.showListInDirButton addTarget:self action:@selector(showListInDirAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.showListInDirButton];
    
    self.fileCreateButton = [UIButton getButtonObject:@"File Create"];
    [self.fileCreateButton addTarget:self action:@selector(fileCreateAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fileCreateButton];
    
    self.fileReadButton = [UIButton getButtonObject:@"File Read"];
    [self.fileReadButton addTarget:self action:@selector(fileReadAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fileReadButton];
    
    self.fileMoveButton = [UIButton getButtonObject:@"File Move"];
    [self.fileMoveButton addTarget:self action:@selector(fileMoveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fileMoveButton];
    
    self.fileRemoveButton = [UIButton getButtonObject:@"File Remove"];
    [self.fileRemoveButton addTarget:self action:@selector(fileRemoveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fileRemoveButton];
    
    self.fileCopyButton = [UIButton getButtonObject:@"File Copy"];
    [self.fileCopyButton addTarget:self action:@selector(fileCopyAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fileCopyButton];
    
    self.fileEqualButton = [UIButton getButtonObject:@"File Equal Check"];
    [self.fileEqualButton addTarget:self action:@selector(fileEqualCheckAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fileEqualButton];
}

- (void)labelConfigure {
    self.pathLabel = [[UILabel alloc] init];
    self.pathLabel.text = @"경로 화면 입니다.";
    self.pathLabel.numberOfLines = 0;
    
    self.resultLabel = [[UILabel alloc] init];
    self.resultLabel.text = @"결과 화면 입니다.";
    self.resultLabel.numberOfLines = 0;
}

#pragma mark - autolayoutSet

- (void)autolayoutConfigure {
    
    UIStackView *stackView1 = UIStackView.new;
    stackView1.axis = UILayoutConstraintAxisHorizontal;
    stackView1.distribution = UIStackViewDistributionFillEqually;
    stackView1.translatesAutoresizingMaskIntoConstraints = NO;
    stackView1.spacing = 8;

    UIStackView *stackView2 = UIStackView.new;
    stackView2.axis = UILayoutConstraintAxisHorizontal;
    stackView2.distribution = UIStackViewDistributionFillEqually;
    stackView2.translatesAutoresizingMaskIntoConstraints = NO;
    stackView2.spacing = 8;
    
    UIStackView *stackView3 = UIStackView.new;
    stackView3.axis = UILayoutConstraintAxisHorizontal;
    stackView3.distribution = UIStackViewDistributionFillEqually;
    stackView3.translatesAutoresizingMaskIntoConstraints = NO;
    stackView3.spacing = 8;
    
    UIStackView *stackView4 = UIStackView.new;
    stackView4.axis = UILayoutConstraintAxisHorizontal;
    stackView4.distribution = UIStackViewDistributionFillEqually;
    stackView4.translatesAutoresizingMaskIntoConstraints = NO;
    stackView4.spacing = 8;
    
    UIStackView *stackView5 = UIStackView.new;
    stackView5.axis = UILayoutConstraintAxisHorizontal;
    stackView5.distribution = UIStackViewDistributionFillEqually;
    stackView5.translatesAutoresizingMaskIntoConstraints = NO;
    stackView5.spacing = 8;

    [stackView1 addArrangedSubview:self.dirCreateButton];
    [stackView1 addArrangedSubview:self.dirMoveButton];
    [stackView2 addArrangedSubview:self.dirRemoveButton];
    [stackView2 addArrangedSubview:self.showListInDirButton];
    [stackView3 addArrangedSubview:self.fileCreateButton];
    [stackView3 addArrangedSubview:self.fileReadButton];
    [stackView4 addArrangedSubview:self.fileMoveButton];
    [stackView4 addArrangedSubview:self.fileRemoveButton];
    [stackView5 addArrangedSubview:self.fileCopyButton];
    [stackView5 addArrangedSubview:self.fileEqualButton];
    
    UIStackView *rootStackView = UIStackView.new;
    rootStackView.axis = UILayoutConstraintAxisVertical;
    rootStackView.distribution = UIStackViewDistributionFillEqually;
    rootStackView.translatesAutoresizingMaskIntoConstraints = NO;
    rootStackView.spacing = 8;
    
    [rootStackView addArrangedSubview:stackView1];
    [rootStackView addArrangedSubview:stackView2];
    [rootStackView addArrangedSubview:stackView3];
    [rootStackView addArrangedSubview:stackView4];
    [rootStackView addArrangedSubview:stackView5];
    [rootStackView addArrangedSubview:self.pathLabel];
    [rootStackView addArrangedSubview:self.resultLabel];
    
    [self.view addSubview:rootStackView];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:rootStackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.f constant:20];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:rootStackView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.f constant:20];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:rootStackView attribute:NSLayoutAttributeTrailing multiplier:1.f constant:20];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:rootStackView attribute:NSLayoutAttributeBottom multiplier:1.f constant:20];
    
   [self.view addConstraints:[NSArray arrayWithObjects:top,leading,trailing,bottom, nil]];
}

#pragma mark - Button Actions

- (void)dirCreateAction
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Directory Name set" message:@"디렉토리 이름 정하시오." preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        [textField addTarget:self
                      action:@selector(alertTextFieldDidChange:)
            forControlEvents:UIControlEventEditingChanged];
        textField.placeholder = @"Directory name";
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSString *newDirName = alertController.textFields.firstObject.text;
        NSString *newDirPath = [self nameToPath:newDirName];
        
        if (![self.fileManager fileExistsAtPath:newDirPath]) {
            if ([self.fileManager createDirectoryAtPath:newDirPath withIntermediateDirectories:YES attributes:nil error:NULL] == YES)
            {
                NSLog(@"폴더 생성 성공");
            } else {
                NSLog(@"폴더 생성 실패");
            }
        } else {
            NSLog(@"이미 폴더가 있다.");
        }
    }];
    
    okAction.enabled = NO;
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)alertTextFieldDidChange:(UITextField *)sender
{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController)
    {
        UITextField *name = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled =  name.text.length > 2;
    }
}

- (void)dirMoveAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Directory Name set" message:@"디렉토리 이름 정하시오." preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        [textField addTarget:self
                      action:@selector(alertTextFieldDidChange:)
            forControlEvents:UIControlEventEditingChanged];
        textField.placeholder = @"Directory name";
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSString *newDirName = alertController.textFields.firstObject.text;
        NSString *newDirPath = [self nameToPath:newDirName];
        
        if ([self.fileManager changeCurrentDirectoryPath:newDirPath] == YES) {
            NSLog(@"폴더 이동 성공");
            self.currentPath = newDirPath;
        } else {
            NSLog(@"폴더 이동 실패");
        }
    }];
    
    okAction.enabled = NO;
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)dirRemoveAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Directory Name set" message:@"디렉토리 이름 정하시오." preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        [textField addTarget:self
                      action:@selector(alertTextFieldDidChange:)
            forControlEvents:UIControlEventEditingChanged];
        textField.placeholder = @"Directory name";
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSString *newDirName = alertController.textFields.firstObject.text;
        NSString *newDirPath = [self nameToPath:newDirName];
        
        if ([self.fileManager removeItemAtPath:newDirPath error:NULL] == YES) {
            NSLog(@"폴더 제거 성공");
        } else {
            NSLog(@"폴더 제거 실패");
        }
    }];
    
    okAction.enabled = NO;
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showListInDirAction
{
    NSArray *fileList = [self.fileManager contentsOfDirectoryAtPath:self.documentPath error:NULL];
    NSMutableString *filesStr = [[NSMutableString alloc] init];
    
    for(NSString *name in fileList) {
        [filesStr appendString:[NSString stringWithFormat:@"%@ ",name]];
        NSLog(@"%@",filesStr);
    }
    self.pathLabel.text = self.currentPath;
    self.resultLabel.text = filesStr;
//    [self prefixSplitByDocument:self.currentPath];
}

- (void)fileCreateAction
{
    NSString *filePath = [self nameToPath:@"test.txt"];
    NSString *tempString = @"cjswlcjswlcjswlcjswlcjswl";
    NSData *dataBuffer = [tempString dataUsingEncoding:NSUTF8StringEncoding];
    
    if ([self.fileManager fileExistsAtPath:filePath] == YES) {
        NSLog(@"해당 파일 존재");
    } else {
        NSLog(@"해당 파일 없음");
        
        [self.fileManager createFileAtPath:filePath contents:dataBuffer attributes:NULL];
    }
}

- (void)fileReadAction
{
    NSString *filePath = [self nameToPath:@"test.txt"];
    NSData *dataBuffer = [self.fileManager contentsAtPath:filePath];
    NSString *contents = [[NSString alloc] initWithData:dataBuffer encoding:NSUTF8StringEncoding];
    NSLog(@"읽은 내용 : %@",contents);
}

- (void)fileMoveAction
{
    NSString *fromPath = [self nameToPath: @"test.txt"];
    NSString *toPath = [self nameToPath:@"new.txt"];
    
    if ([self.fileManager moveItemAtPath:fromPath toPath:toPath error:NULL]) {
        NSLog(@"파일 이동 성공");
    } else {
        NSLog(@"파일 이동 실패");
    }
}

- (void)fileRemoveAction
{
    NSString *filePath = [self nameToPath:@"test.txt"];
    NSError *error;
    BOOL success = [self.fileManager removeItemAtPath:filePath error:&error];
    if (success) {
        NSLog(@"파일 제거 성공");
    } else {
        NSLog(@"파일 제거 실패");
    }
}

- (void)fileCopyAction
{
    NSString *fromPath = [self nameToPath: @"test.txt"];
    NSString *toPath = [self nameToPath:@"copy.txt"];
    
    if ([self.fileManager copyItemAtPath:fromPath toPath:toPath error:NULL] == YES) {
        NSLog(@"파일 복사 성공");
    } else {
        NSLog(@"파일 복사 실패");
    }
}

- (void)fileEqualCheckAction
{
    NSString *firstPath = [self nameToPath: @"test.txt"];
    NSString *secondPath = [self nameToPath:@"copy.txt"];
    
    if ([self.fileManager contentsEqualAtPath:firstPath andPath:secondPath] == YES) {
        NSLog(@"파일 내용 동일");
    } else {
        NSLog(@"파일 내용 다름");
    }
}

#pragma mark - helper
- (NSString *)nameToPath:(NSString *)name {
    return [NSString stringWithFormat:@"%@/%@",self.currentPath,name];
}

//- (NSString *)prefixSplitByDocument:(NSString *)str {
//    NSRange range = [str rangeOfString:@"Document"];
//    if (range.location == NSNotFound) {
//        NSLog(@"not found");
//    }
//    else{
//        NSLog(@"at index %i, length %i", range.location, range.length);
//        NSLog(@"%@",[NSString string])
//    }
//    return str;
//}


@end
