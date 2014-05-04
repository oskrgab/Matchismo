//
//  Deck.h
//  Matchismo
//
//  Created by Oscar Cortez on 4/26/14.
//  Copyright (c) 2014 Oscar Cortez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

//Oscar comement 1

- (void) addCard:(Card *)card atTop:(BOOL)atTop;
- (void) addCard:(Card *)card;

- (Card *) drawRandomCard;

@end
