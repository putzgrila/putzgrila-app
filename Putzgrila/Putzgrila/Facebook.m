//
//  Facebook.m
//  Putzgrila
//
//  Created by Gabriel Martins on 30/10/13.
//
//

#import "Facebook.h"

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
    switch (state) {
        case FBSessionStateOpen:
        {
            //            UIViewController *topViewController =
            //            [self.navController topViewController];
            //            if ([[topViewController modalViewController]
            //                 isKindOfClass:[SCLoginViewController class]]) {
            //                [topViewController dismissModalViewControllerAnimated:YES];
            //            }
            break;
        }
            
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
        {
            // Once the user has logged in, we want them to
            // be looking at the root view.
            //            [self.navController popToRootViewControllerAnimated:NO];
            //
            //            [FBSession.activeSession closeAndClearTokenInformation];
            //
            //            [self showLoginView];
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
