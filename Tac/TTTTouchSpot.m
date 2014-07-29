//
//  TTTTouchSpot.m
//  Tac
//
//  Created by KaL on 7/29/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "TTTTouchSpot.h"
#import "TTTViewController.h"

@implementation TTTTouchSpot
{
    UIImageView *imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //// add a UIImageView
        imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:imageView];

    }
    return self;
}

- (void)setPlayer:(int)player
{
    _player = player;
    
    switch (player) {
        case 0:
            imageView.image = [UIImage imageNamed:@"spot"];
            break;
        case 1:
            imageView.image = [UIImage imageNamed:@"x"];
            break;
        case 2:
            imageView.image = [UIImage imageNamed:@"circle"];
            break;
    }
    
}
//// the image should change inside the player setter method



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
