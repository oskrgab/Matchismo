//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Oscar Cortez on 5/14/14.
//  Copyright (c) 2014 Oscar Cortez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initializer
-(instancetype) initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *) cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSUInteger score;

@end
