//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Yomi on 5/5/14.
//  Copyright (c) 2014 Oscar Cortez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

// designated initializer
-(instancetype)initWithCardCount: (NSUInteger)count
                       usingDeck:(Deck*)deck;
-(Card *)cardAtIndex:(NSUInteger)index;
@property (nonatomic, readonly) NSInteger score;
-(void)chooseCardAtIndex:(NSUInteger)index;



@end
