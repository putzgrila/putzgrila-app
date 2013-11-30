//
//  LoginViewController.m
//  putzgrila
//
//  Created by Gabriel Martins on 25/10/13.
//  Copyright (c) 2013 Gabriel Martins. All rights reserved.
//

#import "LoginViewController.h"
#import "Facebook.h"
#import "ColorUtil.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize loginWebview = _loginWebview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *html = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"html"];
    NSURL *url = [NSURL fileURLWithPath:html];
    
    self.view.backgroundColor = [ColorUtil colorWithHexString:@"ffb600"];
    self.loginWebview.backgroundColor = [ColorUtil colorWithHexString:@"ffb600"];
    
    [self.loginWebview loadRequest:[NSURLRequest requestWithURL:url]];
    [[self.loginWebview scrollView] setBounces:NO];
}

-(void)runJScript:(NSString *)js
{
    [[self loginWebview] stringByEvaluatingJavaScriptFromString:js];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
