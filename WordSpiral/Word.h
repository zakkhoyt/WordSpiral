//
//  Word.h
//  WordSpiral
//
//  Created by Zakk Hoyt on 9/7/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Word : NSObject
- (instancetype)initWithWord:(NSString*)word count:(NSUInteger)count;
- (instancetype)initWithWord:(NSString*)word count:(NSUInteger)count color:(UIColor*)color;
@property (nonatomic, strong, readonly) NSString *word;
@property (nonatomic) NSUInteger count;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *color;
@end
