//
//  TTTGameData.m
//  Tac
//
//  Created by KaL on 8/28/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "TTTGameData.h"
#import "TTTTouchSpot.h"

@implementation TTTGameData

+ (TTTGameData *)mainData
{
    // setting up a variable for dispatch once
    // creating the singleton for the very fist time
    static dispatch_once_t onceToken;
    static TTTGameData *singleton = nil;
    
    // its nil first, then its alloc/init
    // aingleton are made to be only alloc/init once
    dispatch_once(&onceToken, ^{
        singleton = [[TTTGameData alloc]init];
    });
    
    return singleton;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.spots = [@[]mutableCopy];
        self.player1Turn = YES;
    }
    return self;
}

- (void)checkForWinner
{
    NSArray *possibilities = @[
                               @[@0,@1,@2],
                               @[@3,@4,@5],
                               @[@6,@7,@8],
                               @[@0,@3,@6],
                               @[@1,@4,@7],
                               @[@2,@5,@8],
                               @[@0,@4,@8],
                               @[@2,@4,@6],
                               ];
    
    BOOL winner = NO;
    
    for (NSArray *possibility in possibilities)
    {
        TTTTouchSpot *spot0 = self.spots[[possibility[0]intValue]];
        TTTTouchSpot *spot1 = self.spots[[possibility[1]intValue]];
        TTTTouchSpot *spot2 = self.spots[[possibility[2]intValue]];
        
        if (spot0.player == spot1.player && spot1.player == spot2.player && spot0.player != 0)
        {
            winner = YES;
            NSLog(@"player %d",spot0.player);
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Winner" message:[NSString stringWithFormat:@"Player %d Won",spot0.player] delegate:self cancelButtonTitle:@"Start Over" otherButtonTitles:nil];
            [alert show];
        }
    }
    
    int emptySpots = 0;
    
    for (TTTTouchSpot *spot in self.spots) {
        if (spot.player == 0) emptySpots++;
    }
    
    if (emptySpots == 0 && !winner)
    {
        // draw
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Winner" message:@"No player won." delegate:self cancelButtonTitle:@"Start Over" otherButtonTitles:nil];
        [alert show];
    }
    
}

@end
