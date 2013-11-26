//
//  LoginViewController.m
//  putzgrila
//
//  Created by Gabriel Martins on 25/10/13.
//  Copyright (c) 2013 Gabriel Martins. All rights reserved.
//

#import "LoginViewController.h"
#import "Facebook.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded)
    {
        
        NSString *html = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"html"];
        
        NSURL *url = [NSURL fileURLWithPath:html];
        [self.loginWebview loadRequest:[NSURLRequest requestWithURL:url]];
        [[self.loginWebview scrollView] setBounces:NO];
        // Yes, so just open the session (this won't display any UX).
        //[LoginViewController openSession];
    }
    else
    {
        [Facebook openSession];
        
//        NSString *html = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"html"];
//        
//        NSURL *url = [NSURL fileURLWithPath:html];
//        [self.loginWebview loadRequest:[NSURLRequest requestWithURL:url]];
//        [[self.loginWebview scrollView] setBounces:NO];
        
//        [LoginViewController openSession];
        // No, display the login page.
        // [self showLoginView];
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
