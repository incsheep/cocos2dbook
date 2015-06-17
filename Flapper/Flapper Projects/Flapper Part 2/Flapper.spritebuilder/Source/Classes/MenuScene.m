//
//  MenuScene.m
//  Flapper
//
//  Created by Jeremy Novak on 6/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MenuScene.h"
#import "GameScene.h"

@interface MenuScene ()
@property (nonatomic) CGSize viewSize;
@property (nonatomic) CCLabelBMFont *startButton;
@end

@implementation MenuScene

+(MenuScene *)scene {
    return [[self alloc] init];
}

-(instancetype)init {
    if ((self = [super init])) {
        
    }
    
    self.viewSize = [CCDirector sharedDirector].viewSize;
    [self setupMenuScene];
    
    if (kDebug) {
        CCLOG(@"Created Menu Scene");
    }
    
    return self;
}

#pragma mark - Update

#pragma mark - Touch Events
-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint touchLocation = [touch locationInNode:self];
    
    if (CGRectContainsPoint(self.startButton.boundingBox, touchLocation)) {
        [self loadGameScene];
    }
}

#pragma mark - Action Methods
-(void)loadGameScene {
    GameScene *gameScene = [GameScene scene];
    [[CCDirector sharedDirector] presentScene:gameScene];
}

#pragma mark - Setup Methods
-(void)setupMenuScene {
    CCSprite *backgroundLayer0 = [CCSprite spriteWithImageNamed:kBackgroundLayer0];
    backgroundLayer0.anchorPoint = CGPointZero;
    [self addChild:backgroundLayer0];
    
    self.startButton = [CCLabelBMFont labelWithString:@"Load GameScene" fntFile:kGameFont];
    self.startButton.position = ccp(self.viewSize.width / 2, self.viewSize.height / 2);
    [self addChild:self.startButton];
    
    self.userInteractionEnabled = YES;
}

-(void)dealloc {
    if (kDebug) {
        CCLOG(@"Destroyed Menu Scene");
    }
}

@end
