//
//  PRequestUtil.h
//  Putzgrila
//
//  Created by Gabriel Martins on 26/10/13.
//
//

#import <Foundation/Foundation.h>

@interface RequestUtil : NSObject

+ (NSString *) getParameter:(NSURLRequest *) request parameterName:(NSString  *)parameterName;

@end
