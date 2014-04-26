//
//  MainMenuScene.m
//  IgaBall
//
//  Created by Vitalii Parovishnyk on 4/26/14.
//  Copyright (c) 2014 IGR Software. All rights reserved.
//

#import "MainMenuScene.h"
#import "GameController.h"

@interface MainMenuScene ()

@property (nonatomic, weak) GameController *viewController;

@end

@implementation MainMenuScene

- (id)initWithSize:(CGSize)size controller:(GameController *)controller
{
	DBNSLog(@"%s", __func__);
	
    if (self = [super initWithSize:size])
	{
        /* Setup your scene here */
		self.viewController = controller;
		self.name = NSStringFromClass([self class]);
		
		self.backgroundColor = [UIColor colorWithRed:110.f/255.f green:170.f/255.f blue:220.f/255.f alpha:1.f];
		
		SKTexture *texture = texture = [SKTexture textureWithImageNamed:@"GameName"];
		
        SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithTexture:texture size:texture.size];
		
        bgImage.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame) + 200);
        
        [self addChild:bgImage];
		
		[self runAction:
		 [SKAction sequence:@[
							  [SKAction waitForDuration:0.2],
							  [SKAction runBlock:^{
			 
			 [self.viewController setupMainMenu];
		 }]
							  ]]
		 ];
    }
	
    return self;
}

-(void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
}

@end