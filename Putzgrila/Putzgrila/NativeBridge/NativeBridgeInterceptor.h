//
//  NativeBridgeInterceptor.h
//  Putzgrila
//
//  Created by Gabriel Martins on 26/10/13.
//
//

#import <Foundation/Foundation.h>
#import "OfflineResponse.h"

@interface NativeBridgeInterceptor : NSObject

+ (BOOL) shouldInterceptRequest: (NSURL *) URL;
+ (OfflineResponse *) processRequest: (NSURLRequest*)request;

@end
