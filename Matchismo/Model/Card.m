//
//  Card.m
//  Matchismo
//
//  Created by Oscar Cortez on 4/26/14.
//  Copyright (c) 2014 Oscar Cortez. All rights reserved.
//

#import "Card.h"

@interface Card()
// Oscar comentario

@end

@implementation Card


- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents] ) {
            score = 1;
        }
    }
    
    return score;
}

@end
