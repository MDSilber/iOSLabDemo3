//
//  WebpageViewController.m
//  iOSLabDemo3
//
//  Created by Mason Silber on 3/7/13.
//  Copyright (c) 2013 Mason Silber. All rights reserved.
//

#import "WebpageViewController.h"

@interface WebpageViewController ()
@property (nonatomic, strong) NSString *website;
@end

@implementation WebpageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithWebsite:(NSString *)website
{
    self = [super init];
    if(self)
    {
        _website = website;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIWebView *webview = [[UIWebView alloc] initWithFrame:[[self view] frame]];
    NSURL *websiteURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.%@.com",_website]];
    NSURLRequest *websiteRequest = [NSURLRequest requestWithURL:websiteURL];
    [webview loadRequest:websiteRequest];
    [[self view] addSubview:webview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
