//
//  WordProcessor.h
//  WordSpiral
//
//  Created by Zakk Hoyt on 9/7/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordProcessor : NSObject
+(NSArray*)countWordsInFileAtPath:(NSString*)path;
@end
