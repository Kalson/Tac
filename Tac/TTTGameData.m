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
{
    NSArray *possibilities;
}

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
        
        possibilities = @[
                                   @[@0,@1,@2],
                                   @[@3,@4,@5],
                                   @[@6,@7,@8],
                                   @[@0,@3,@6],
                                   @[@1,@4,@7],
                                   @[@2,@5,@8],
                                   @[@0,@4,@8],
                                   @[@2,@4,@6],
                                   ];
    }
    return self;
}

- (void)setPlayer1Turn:(BOOL)player1Turn
{
    _player1Turn = player1Turn;
    
    if (player1Turn == NO)
    {
        // run robot
        
        [self robotChooseSpot];
    }
}

- (void)robotChooseSpot
{
    for (TTTTouchSpot *spot in self.spots)
        
        // set a spot.player
        // change player1Turn
        // checkForWinner
        if (spot.player == 0) {
            
            // chooses the spot
            spot.player = 2;
            
            // now we want to stop the loop
            
            // switches to the next player
            self.player1Turn = !self.player1Turn;
            [self checkForWinner];
            
            return;
        }
}

- (void)checkForWinner
{
  
    
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


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.player1Turn = YES;
    
    for (TTTTouchSpot *spot in self.spots) {
        spot.player = 0;
    }
}

@end
