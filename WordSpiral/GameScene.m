//
//  GameScene.m
//  WordSpiral
//
//  Created by Zakk Hoyt on 9/7/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "GameScene.h"
#import "Word.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
//    /* Setup your scene here */
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 45;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
//}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)renderWords:(NSArray*)words{
 
    __block CGFloat yOffset = 0;
    [words enumerateObjectsUsingBlock:^(Word *word, NSUInteger idx, BOOL * _Nonnull stop) {
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = word.word;
        myLabel.fontSize = word.font.pointSize;
        
        NSDictionary *attributes = @{NSFontAttributeName: word.font};
        CGSize size = [word.word sizeWithAttributes:attributes];
        
//        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                       self.frame.size.height - 10 * idx);
        
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       self.frame.size.height - yOffset - size.height);

        yOffset += size.height;
        [self addChild:myLabel];

    }];
}

@end
