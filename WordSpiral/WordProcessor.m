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
        [words enumerateObjectsUsingBlock:^(NSString *_Nonnull word, NSUInteger idx, BOOL * _Nonnull stop) {
            
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
        return ret;
    }
    
    
}

@end
