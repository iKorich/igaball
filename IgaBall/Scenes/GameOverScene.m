//
//  GameOverScene.m
//  IgaBall
//
//  Created by Vitalii Parovishnyk on 4/29/14.
//  Copyright (c) 2014 IGR Software. All rights reserved.
//

#import "GameOverScene.h"
#import "Constants.h"
#import "ShadowLabelNode.h"

@implementation GameOverScene

- (id)initWithSize:(CGSize)aSize gameController:(GameController *)gGameController
{
    DBNSLog(@"%s", __func__);
    
    if (self = [super initWithSize:aSize gameController:gGameController])
	{
        // 1
        BOOL isIPhone = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
        		
		SKTexture *texture = [SKTexture textureWithImageNamed:@"bg_gameover"];
		SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithTexture:texture size:aSize];
        
        bgImage.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        bgImage.zPosition = kPositionZBGImage;
        [self addChild:bgImage];
		
        // 2
        NSString * message = [NSString stringWithFormat:@"Your Score: %@", @(gGameController.score)];
		
        // 3
        CGFloat titleFontSize = isIPhone ? 30.f : 50.f;
        
        ShadowLabelNode *label = [ShadowLabelNode labelNodeWithFontNamed:kDefaultFont];
        label.text = message;
        label.fontSize = titleFontSize;
        
        CGFloat yOffset = 180.f;
        if (isIPhone)
        {
            yOffset = 60.f;
        }
        
        label.position = CGPointMake(self.size.width/2, self.size.height/2 + yOffset);
        label.zPosition = kPositionZLabels;
        [self addChild:label];
    }
    
    return self;
}

@end
