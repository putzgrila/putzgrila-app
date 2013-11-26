//
//  NativeBridgeInterceptor.m
//  Putzgrila
//
//  Created by Gabriel Martins on 26/10/13.
//
//

#import "NativeBridgeInterceptor.h"
#import "RequestUtil.h"
#import "PutzgrilaAppDelegate.h"

#define URL_MATCH(ORIGINAL_URL, URL) ([ORIGINAL_URL.absoluteString rangeOfString:URL].location != NSNotFound)

@implementation NativeBridgeInterceptor

+ (BOOL) shouldInterceptRequest: (NSURL *) URL
{
    if( [[URL scheme] isEqualToString:@"http"] )
    {
        if ( URL_MATCH(URL, @"provisioningfiledownload.jsp") && !URL_MATCH(URL, @"&native_call=1"))
            return true;
    }

    return [[URL scheme] isEqualToString:@"tbk"];
}

+ (OfflineResponse *) processRequest: (NSURLRequest*)request
{
    OfflineResponse *response = nil;
    
    if (URL_MATCH(request.URL, @"segue"))
    {
//        NSString *categoryId = [RequestUtil getParameter:request parameterName:@"categoryId"];
    }


    return response;
}

@end
