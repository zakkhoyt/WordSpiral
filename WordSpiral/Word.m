//
//  Word.m
//  WordSpiral
//
//  Created by Zakk Hoyt on 9/7/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "Word.h"

@interface Word ()
@property (nonatomic, strong, readwrite) NSString *word;
@end

@implementation Word
- (instancetype)initWithWord:(NSString*)word count:(NSUInteger)count {
    return [self initWithWord:word count:count color:nil];
}

- (instancetype)initWithWord:(NSString*)word count:(NSUInteger)count color:(UIColor *)color{
    self = [super init];
    if (self) {
        _word = [word capitalizedString];
        _count = count;
        _color = color;
    }
    return self;
}

-(BOOL)isEqual:(id)object{
    if([object isKindOfClass:[Word class]] == NO) {
        return NO;
    }
    
    Word *word = (Word*)object;
    return [[word.word uppercaseString] isEqualToString:[self.word uppercaseString]];
}

-(NSUInteger)hash{
    return self.word.hash;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"%@: %lu", self.word, self.count];
}
@end
