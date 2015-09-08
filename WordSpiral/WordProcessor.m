//
//  WordProcessor.m
//  WordSpiral
//
//  Created by Zakk Hoyt on 9/7/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "WordProcessor.h"
#import "Word.h"

@implementation WordProcessor


+(NSArray*)countWordsInFileAtPath:(NSString*)path{
    NSError *error = nil;
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if(error){
        NSLog(@"Error reading file: %@: %@", path, error.localizedDescription);
        return nil;
    } else {

        NSArray* words = [content componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSMutableArray *ret = [[NSMutableArray alloc]initWithCapacity:words.count];
        [words enumerateObjectsUsingBlock:^(NSString *word, NSUInteger idx, BOOL *stop) {
            
            if(word.length <= 3){
                return ;
            }
            
            Word *newWord = [[Word alloc ]initWithWord:word count:1];
            if([ret containsObject:newWord] == YES){
                 // Increment count
                NSUInteger index = [ret indexOfObject:newWord];
                Word *existingWord = [ret objectAtIndex:index];
                existingWord.count++;
            } else {
                // Create new word and add to array
                [ret addObject:newWord];
            }
        }];
        
        // Now sort the array by Word.count
        [ret sortUsingComparator:^NSComparisonResult(Word *word1, Word *word2) {
            if(word1.count > word2.count){
                return NSOrderedAscending;
            } else {
                return NSOrderedDescending;
            }
        }];
        
//        // Assign a font size based on count
//        Word *firstWord = [ret firstObject];
//        Word *lastWord = [ret lastObject];
//        NSUInteger maxCount = firstWord.count;
//        NSUInteger minCount = lastWord.count;
//        CGFloat maxFontSize = 70;
//        CGFloat minFontSize = 8;
        [ret enumerateObjectsUsingBlock:^(Word *word, NSUInteger idx, BOOL *stop) {
            CGFloat pointSize = word.count * 4;
            word.font =[UIFont fontWithName:@"Chalkduster" size:pointSize];
            
            NSDictionary *attributes = @{NSFontAttributeName: word.font};
            CGSize size = [word.word sizeWithAttributes:attributes];
            const CGFloat kBorder = 4;
            word.size = CGSizeMake(size.width + kBorder, size.height + kBorder);
        }];
        
//        return [NSArray arrayWithObjects:ret[0], ret[1], ret[2], ret[3], ret[4], ret[5], nil];

//        return [ret subarrayWithRange:NSMakeRange(0, 120)];
        return ret;
    }
}


@end
