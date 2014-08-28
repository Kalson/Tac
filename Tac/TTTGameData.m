//
//  TTTGameData.m
//  Tac
//
//  Created by KaL on 8/28/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "TTTGameData.h"

@implementation TTTGameData

+ (TTTGameData *)mainData
{
    // setting up a variable for dispatch once
    // creating the singleton for the very fist time
    static dispatch_once_t onceToken;
    static TTTGameData *singleton = nil;
    
    // its nil first, then its alloc/init
    dispatch_once(&onceToken, ^{
        singleton = [[TTTGameData alloc]init];
    });
    
    return singleton;
}

@end
