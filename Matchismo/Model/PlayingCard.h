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
//Oscar comentario
//Comentarios
// Cambio Oscar
//Otro cambio
//Cambios que hago antes de hacer

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSArray *) rankStrings;
+ (NSUInteger) maxRank;
//hello again
@end
