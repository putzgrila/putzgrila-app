//
//  Facebook.h
//  Putzgrila
//
//  Created by Gabriel Martins on 30/10/13.
//
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface Facebook : NSObject

+ (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state
                      error:(NSError *)error;

+ (void)openSession;

+ (void)closeSession;

@end
