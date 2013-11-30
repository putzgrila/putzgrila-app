//
//  Facebook.m
//  Putzgrila
//
//  Created by Gabriel Martins on 30/10/13.
//
//

#import "Facebook.h"
#import "LoginViewController.h"
#import "LoginWebView.h"

@implementation Facebook


+ (void)openSession
{
    [FBSession openActiveSessionWithReadPermissions:nil
                                       allowLoginUI:YES
                                  completionHandler:
     ^(FBSession *session,
       FBSessionState state, NSError *error) {
         [self sessionStateChanged:session state:state error:error];
     }];
}

+(void)closeSession
{
    [FBSession.activeSession closeAndClearTokenInformation];
    [FBSession.activeSession close];
    [FBSession setActiveSession:nil];
}

+ (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    switch (state)
    {
        case FBSessionStateOpen:
        {
            //User is now logged with facebook...
            
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            [(LoginViewController *)window.rootViewController runJScript:@"HTMLView.openActivity()"];
            break;
        }
            
        case FBSessionStateClosed:
        {
            NSLog(@"");
            break;
        }
        case FBSessionStateClosedLoginFailed:
        {
            NSLog(@"");
            break;
        }
            
        default:
            break;
    }
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:error.localizedDescription
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

@end
