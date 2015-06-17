//
//  GameScene.m
//  Flapper
//
//  Created by Jeremy Novak on 6/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "GameScene.h"
#import "MenuScene.h"

@interface GameScene ()
@property (nonatomic) CGSize viewSize;
@property (nonatomic) CCLabelBMFont *menuButton;
@end

@implementation GameScene

+(GameScene *)scene {
    return [[self alloc] init];
}

-(instancetype)init {
    if ((self = [super init])) {
        
    }
    
    self.viewSize = [CCDirector sharedDirector].viewSize;
    [self setupGameScene];
    
    if (kDebug) {
        CCLOG(@"Created Game Scene");
    }
    
    return self;
}

#pragma mark - Update

#pragma mark - Touch Events
-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint touchLocation = [touch locationInNode:self];
    
    if (CGRectContainsPoint(self.menuButton.boundingBox, touchLocation)) {
        [self loadMenuScene];
    }
}

#pragma mark - Action Methods
-(void)loadMenuScene {
    MenuScene *menuScene = [MenuScene scene];
    [[CCDirector sharedDirector] presentScene:menuScene];
}

#pragma mark - Setup Methods
-(void)setupGameScene {
    CCSprite *layer0 = [CCSprite spriteWithImageNamed:kBackgroundLayer0];
    layer0.anchorPoint = CGPointZero;
    [self addChild:layer0];
    
    self.menuButton = [CCLabelBMFont labelWithString:@"Load MenuScene" fntFile:kGameFont];
    self.menuButton.position = ccp(self.viewSize.width / 2, self.viewSize.height / 2);
    [self addChild:self.menuButton];
    
    self.userInteractionEnabled = YES;
}

-(void)dealloc {
    if (kDebug) {
        CCLOG(@"Destroyed Game Scene");
    }
}

@end
