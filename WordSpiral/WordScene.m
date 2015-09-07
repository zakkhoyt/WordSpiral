//
//  GameScene.m
//  WordSpiral
//
//  Created by Zakk Hoyt on 9/7/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "WordScene.h"
#import "Word.h"

@implementation WordScene

-(void)didMoveToView:(SKView *)view {
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)update:(CFTimeInterval)currentTime {
}

-(void)renderWords:(NSArray*)words{
 
    
    __block CGFloat yOffset = 0;
    [words enumerateObjectsUsingBlock:^(Word *word, NSUInteger idx, BOOL * _Nonnull stop) {
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = word.word;
        myLabel.fontSize = word.font.pointSize;
        
        NSDictionary *attributes = @{NSFontAttributeName: word.font};
        CGSize size = [word.word sizeWithAttributes:attributes];
        
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       self.frame.size.height - yOffset - size.height);

        yOffset += size.height;
        [self addChild:myLabel];

    }];
}

@end
