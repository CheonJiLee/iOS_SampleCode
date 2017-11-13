//
//  CJURLSessionViewcontroller.m
//  EXURLSession2
//
//  Created by USER on 2017. 11. 13..
//  Copyright © 2017년 USER. All rights reserved.
// http://hayageek.com/ios-nsurlsession-example - 샘플 예제 URL

#import "CJURLSessionViewcontroller.h"

#import "AppDelegate.h"
@interface CJURLSessionViewcontroller() <NSURLSessionDataDelegate, NSURLSessionDownloadDelegate,NSURLSessionTaskDelegate>
@property (strong, nonatomic) UIButton *postButton;
@property (strong, nonatomic) UIButton *getButton;
@property (strong, nonatomic) UIButton *fileDownButton;
@property (strong, nonatomic) UIButton *backgroundDownButton;
@property (strong, nonatomic) UIProgressView *progressView;
@end

@implementation CJURLSessionViewcontroller

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self configureButton];
    [self configureProgressView];
    [self.progressView setProgress:0];
}

- (void)configureButton
{
    NSInteger padding = 10;
    NSInteger buttonWidth = 200;
    NSInteger buttonHeight = 50;
    
    self.postButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.postButton setTitle:@"HTTP POST" forState:UIControlStateNormal];
    [self.postButton setFrame:CGRectMake(padding, 100, buttonWidth, buttonHeight)];
    [self.postButton addTarget:self action:@selector(sendHTTPPost) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.postButton];
    
    self.getButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.getButton setTitle:@"HTTP GET" forState:UIControlStateNormal];
    [self.getButton setFrame:CGRectMake(padding + buttonWidth, 100, buttonWidth, buttonHeight)];
    [self.getButton addTarget:self action:@selector(httpGETWithCustomDelegate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.getButton];
    
    self.fileDownButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.fileDownButton setTitle:@"File Download" forState:UIControlStateNormal];
    [self.fileDownButton setFrame:CGRectMake(padding, 200, buttonWidth, buttonHeight)];
    [self.fileDownButton addTarget:self action:@selector(downloadFileWithProgress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fileDownButton];
    
    self.backgroundDownButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.backgroundDownButton setTitle:@"Background Download" forState:UIControlStateNormal];
    [self.backgroundDownButton setFrame:CGRectMake(padding, 300, buttonWidth, buttonHeight)];
    [self.backgroundDownButton addTarget:self action:@selector(backgroundDownloadTask) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backgroundDownButton];
}

- (void)configureProgressView
{
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [self.progressView setFrame:CGRectMake(20, 250, 200, 50)];
    [[self.progressView layer]setBorderColor:[UIColor redColor].CGColor];
    self.progressView.trackTintColor = [UIColor lightGrayColor];
    self.progressView.progressTintColor = [UIColor blueColor];
    self.progressView.clipsToBounds = YES;
    
    [self.view addSubview:self.progressView];
}


#pragma mark - Button Action


// HTTP.GET, POST with Custome delegate method

- (void) httpGETWithCustomDelegate
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURL *url = [NSURL URLWithString:@"http://hayageek.com/"];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"Data = %@", text);
        }
    }];
    [dataTask resume];
}


- (void) httpPostWithCustomDelegate
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"http://hayageek.com/examples/jquery/ajax-post/ajax-post.php"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSString * params =@"name=Ravi&loc=India&age=31&submit=true";
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:urlRequest
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                            NSLog(@"Response:%@ %@\n", response, error);
                                                            if(error == nil)
                                                            {
                                                                NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                                NSLog(@"Data = %@",text);
                                                            }
                                                        }];
    [dataTask resume];
}

// HTTP POST with System-based delegate method (NSURLSessionDataDelegate)
- (void) sendHTTPPost
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURL * url = [NSURL URLWithString:@"http://hayageek.com/examples/jquery/ajax-post/ajax-post.php"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *params = @"name=Ravi&loc=India&age=31&submit=true";
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest];
    [dataTask resume];
}



- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    NSLog(@"### handler 1");
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Received String %@", str);
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (error == nil)
    {
        NSLog(@"Download is Succesfull");
    }
    else
    {
        NSLog(@"Error %@", [error userInfo]);
    }
}


#pragma mark - Download Task

// custom download delegate mathod
- (void)downloadFile
{
    NSURL * url = [NSURL URLWithString:@"https://s3.amazonaws.com/hayageek/downloads/SimpleBackgroundFetch.zip"];
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask *downloadTask = [defaultSession downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSLog(@"Temporary file = %@", location);
            
            NSError *err = nil;
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            
            NSURL *docsDirURL = [NSURL fileURLWithPath:[docsDir stringByAppendingPathComponent:@"out.zip"]];
            
            if([fileManager moveItemAtURL:location toURL:docsDirURL error:&err])
            {
                NSLog(@"File is saved to = %@",docsDir);
            }
            else
            {
                NSLog(@"Failed to move: %@", [err userInfo]);
            }
        }
    }];
    
    [downloadTask resume];
}

// system-based delegate method
- (void)downloadFileWithProgress
{
    NSURL * url = [NSURL URLWithString:@"http://manuals.info.apple.com/MANUALS/1000/MA1565/en_US/iphone_user_guide.pdf"];
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate:self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask * downloadTask = [defaultSession downloadTaskWithURL:url];
    [downloadTask resume];
}

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location
{
    NSLog(@"Temporary File :%@\n", location);
    NSError *err = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    
    NSURL *docsDirURL = [NSURL fileURLWithPath:[docsDir stringByAppendingPathComponent:@"out1.zip"]];
    if ([fileManager moveItemAtURL:location
                             toURL:docsDirURL
                             error: &err])
    {
        NSLog(@"File is saved to =%@",docsDir);
    }
    else
    {
        NSLog(@"failed to move: %@",[err userInfo]);
    }
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress = totalBytesWritten*1.0/totalBytesExpectedToWrite;
    dispatch_async(dispatch_get_main_queue(),^ {
        [self.progressView setProgress:progress animated:YES];
    });
    NSLog(@"Progress =%f",progress);
    NSLog(@"Received: %lld bytes (Downloaded: %lld bytes)  Expected: %lld bytes.\n",
          bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes
{
    
}

#pragma mark - backgroundDownload Task

- (void)backgroundDownloadTask
{
    NSURL * url = [NSURL URLWithString:@"http://manuals.info.apple.com/MANUALS/1000/MA1565/en_US/iphone_user_guide.pdf"];
    NSURLSessionConfiguration * backgroundConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"backgroundtask1"];
    
    NSURLSession *backgroundSeesion = [NSURLSession sessionWithConfiguration: backgroundConfig delegate:self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask * downloadTask = [backgroundSeesion downloadTaskWithURL:url];
    [downloadTask resume];
    
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    NSLog(@"Background URL session %@ finished events . \n", session);
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (delegate.completionHandler) {
        void (^handler)(void) = delegate.completionHandler;
        handler();
    }
}


@end











