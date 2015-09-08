//
//  GameScene.m
//  WordSpiral
//
//  Created by Zakk Hoyt on 9/7/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "WordScene.h"
#import "Word.h"


@interface WordScene ()
@property (nonatomic, strong) NSArray *draggingNodes;
@property (nonatomic, strong) NSMutableArray *placedWords;
@end
@implementation WordScene

//-(void)didMoveToView:(SKView *)view {
//    
////    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
////    [self.view addGestureRecognizer:tapRecognizer];
//    
//    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
//    [self.view addGestureRecognizer:panRecognizer];
//    
//
//}
//
////-(void)tapGesture:(UITapGestureRecognizer*)sender{
////    if(sender.state == UIGestureRecognizerStateBegan) {
////        NSLog(@"Began");
////    } else if (sender.state == UIGestureRecognizerStateEnded) {
////        NSLog(@"end");
////    }
//////    if (sender.state == UIGestureRecognizerStateBegan) {
//////        CGPoint point = [sender locationInView:sender.view];
//////        point.y = self.frame.size.height - point.y;
//////        
//////        NSArray *nodes = [self nodesAtPoint:point];
//////        [nodes enumerateObjectsUsingBlock:^(SKNode *node, NSUInteger idx, BOOL *  stop) {
//////            if([node isKindOfClass:[SKLabelNode class]]){
//////                SKLabelNode *labelNode = (SKLabelNode*)node;
//////                labelNode.fontColor = [UIColor redColor];
//////            }
//////        }];
//////    } else if (sender.state == UIGestureRecognizerStateEnded) {
//////        NSLog(@"end");
//////    }
////}
//
//-(void)panGesture:(UIPanGestureRecognizer*)sender{
//    if (sender.state == UIGestureRecognizerStateBegan) {
//        
////        CGPoint touchLocation = [sender locationInView:recognizer.view];
////        touchLocation = [self convertPointFromView:touchLocation];
////        [self selectNodeForTouch:touchLocation];
//        CGPoint point = [sender locationInView:sender.view];
//        point.y = self.frame.size.height - point.y;
//        
//        NSArray *nodes = [self nodesAtPoint:point];
//        [nodes enumerateObjectsUsingBlock:^(SKNode *node, NSUInteger idx, BOOL *  stop) {
//            if([node isKindOfClass:[SKLabelNode class]]){
//                SKLabelNode *labelNode = (SKLabelNode*)node;
//                labelNode.fontColor = [UIColor redColor];
//            }
//        }];
//
//        
//    } else if (sender.state == UIGestureRecognizerStateChanged) {
//        
////        CGPoint translation = [recognizer translationInView:recognizer.view];
////        translation = CGPointMake(translation.x, -translation.y);
////        [self panForTranslation:translation];
////        [recognizer setTranslation:CGPointZero inView:recognizer.view];
//        
//    } else if (sender.state == UIGestureRecognizerStateEnded) {
//        
////        if (![[_selectedNode name] isEqualToString:kAnimalNodeName]) {
////            float scrollDuration = 0.2;
////            CGPoint velocity = [recognizer velocityInView:recognizer.view];
////            CGPoint pos = [_selectedNode position];
////            CGPoint p = mult(velocity, scrollDuration);
////            
////            CGPoint newPos = CGPointMake(pos.x + p.x, pos.y + p.y);
////            newPos = [self boundLayerPos:newPos];
////            [_selectedNode removeAllActions];
////            
////            SKAction *moveTo = [SKAction moveTo:newPos duration:scrollDuration];
////            [moveTo setTimingMode:SKActionTimingEaseOut];
////            [_selectedNode runAction:moveTo];
////        }
//        
//    }
//}
//
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInNode:self];
//    self.draggingNodes = [self nodesAtPoint:point];
//    [self.draggingNodes enumerateObjectsUsingBlock:^(SKNode *node, NSUInteger idx, BOOL *  stop) {
//        if([node isKindOfClass:[SKLabelNode class]]){
//            SKLabelNode *labelNode = (SKLabelNode*)node;
//            labelNode.fontColor = [UIColor redColor];
//        }
//    }];
//}
//
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.draggingNodes enumerateObjectsUsingBlock:^(SKNode *node, NSUInteger idx, BOOL *  stop) {
//        if([node isKindOfClass:[SKLabelNode class]]){
//            SKLabelNode *labelNode = (SKLabelNode*)node;
//            labelNode.fontColor = [UIColor grayColor];
//        }
//    }];
//}

-(void)update:(CFTimeInterval)currentTime {
}

-(void)renderWords:(NSArray*)words{
    self.placedWords = [[NSMutableArray alloc]initWithCapacity:words.count];
    
    
//    __block CGFloat yOffset = 0;
    [words enumerateObjectsUsingBlock:^(Word *word, NSUInteger idx, BOOL *stop) {
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = word.word;
        myLabel.fontSize = word.font.pointSize;
        myLabel.name = word.word;
        myLabel.position = [self findPlaceForWord:word];

        [self addChild:myLabel];

    }];
}


#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)

-(CGPoint)findPlaceForWord:(Word*)word{
//    // Starting at the center of our view, spiral outwards seeing if the rect intersects any other rect that's been layed out so far
//    for(NSUInteger pixels = 0; pixels < self.view.frame.size.height / 2.0; pixels+=5){
//        for(NSUInteger degrees = 0; degrees < 360; degrees+=5){
//            CGFloat radians = DEGREES_TO_RADIANS(degrees);
//            CGFloat x = CGRectGetMidX(self.frame);
//            CGFloat y = CGRectGetMidY(self.frame);
//            CGFloat xOffset = cos(radians);
//            CGFloat yOffset = sin(radians);
//            xOffset *= pixels;
//            yOffset *= pixels;
//            x += xOffset;
//            y += yOffset;
//
//            // Check if this position and size intersect any in self.placedWords. If not, place it and return.
//            CGRect proposedRect = CGRectMake(x - word.size.width / 2.0,
//                                             y - word.size.height / 2.0,
//                                             word.size.width,
//                                             word.size.height);
//            
//            if(CGRectContainsRect(self.frame, proposedRect) == NO){
//                continue;
//            }
//
//            
//            if(self.placedWords.count == 0){
//                word.placedRect = proposedRect;
//                [self.placedWords addObject:word];
//                return CGPointMake(proposedRect.origin.x + proposedRect.size.width / 2.0,
//                                   proposedRect.origin.y + proposedRect.size.height / 2.0);
//            } else {
//                // check if it intersects any work in self.placedWords
//                __block BOOL found = YES;
//                
//                for(Word *placedWord in self.placedWords){
//                    if(CGRectIntersectsRect(placedWord.placedRect, proposedRect) == YES){
//                        found = NO;
//                        break;
//                    }
//                }
//                
//                if(found == YES){
//                    word.placedRect = proposedRect;
//                    [self.placedWords addObject:word];
//                    return CGPointMake(proposedRect.origin.x + proposedRect.size.width / 2.0,
//                                       proposedRect.origin.y + proposedRect.size.height / 2.0);
//                }
//            }
//        }
//    }
//
//    
//    //return CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//    return CGPointMake(10000, 10000);
    
    // Starting at the center of our view, spiral outwards seeing if the rect intersects any other rect that's been layed out so far
//    for(NSUInteger pixels = 0; pixels < self.view.frame.size.height / 2.0; pixels+=5){
//        for(NSUInteger degrees = 0; degrees < 360; degrees+=5){
//            CGFloat radians = DEGREES_TO_RADIANS(degrees);
//            CGFloat x = CGRectGetMidX(self.frame);
//            CGFloat y = CGRectGetMidY(self.frame);
//            CGFloat xOffset = cos(radians);
//            CGFloat yOffset = sin(radians);
//            xOffset *= pixels;
//            yOffset *= pixels;
//            x += xOffset;
//            y += yOffset;
    
//    while (YES) {
    for(NSUInteger index = 0; index < self.view.bounds.size.width * self.view.bounds.size.height; index++) {
        NSUInteger xRand = arc4random() % (NSUInteger)self.frame.size.width;
        NSUInteger yRand = arc4random() % (NSUInteger)self.frame.size.height;
        CGFloat x = xRand;
        CGFloat y = yRand;
        
        // Check if this position and size intersect any in self.placedWords. If not, place it and return.
        CGRect proposedRect = CGRectMake(x - word.size.width / 2.0,
                                         y - word.size.height / 2.0,
                                         word.size.width,
                                         word.size.height);
        
        if(CGRectContainsRect(self.frame, proposedRect) == NO){
            continue;
        }
        
        
        if(self.placedWords.count == 0){
            word.placedRect = proposedRect;
            [self.placedWords addObject:word];
            return CGPointMake(proposedRect.origin.x + proposedRect.size.width / 2.0,
                               proposedRect.origin.y + proposedRect.size.height / 2.0);
        } else {
            // check if it intersects any work in self.placedWords
            __block BOOL found = YES;
            
            for(Word *placedWord in self.placedWords){
                if(CGRectIntersectsRect(placedWord.placedRect, proposedRect) == YES){
                    found = NO;
                    break;
                }
            }
            
            if(found == YES){
                word.placedRect = proposedRect;
                [self.placedWords addObject:word];
                return CGPointMake(proposedRect.origin.x + proposedRect.size.width / 2.0,
                                   proposedRect.origin.y + proposedRect.size.height / 2.0);
            }
        }
        //        }
        //    }
    }
    
    // Return a position somewhere far away. The right hting to do is check the return value and not add this node at all.
    return CGPointMake(10000, 10000);

}

@end
