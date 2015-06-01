//
//  TTTGameData.h
//  Tac
//
//  Created by KaL on 8/28/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTTGameData : NSObject

+ (TTTGameData *)mainData;

- (void)checkForWinner;

@property (nonatomic) NSMutableArray *spots;
@property (nonatomic) BOOL player1Turn;

@end
