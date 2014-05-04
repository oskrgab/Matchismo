//
//  PlayingCard.h
//  Matchismo
//
//  Created by Oscar Cortez on 4/26/14.
//  Copyright (c) 2014 Oscar Cortez. All rights reserved.
//

#import "Card.h"

@interface PlayingCard :Card
//david
//Oscar

//Comentarios

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSArray *) rankStrings;
+ (NSUInteger) maxRank;
//hello again
@end
