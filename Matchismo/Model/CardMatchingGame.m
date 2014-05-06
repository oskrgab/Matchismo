//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Yomi on 5/5/14.
//  Copyright (c) 2014 Oscar Cortez. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards; //of card
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards)_cards=[[NSMutableArray alloc]init];
    return _cards;
    
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck*)deck;
{
    self= [super init];
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card=[deck drawRandomCard];
            if (card) {
                //self.cards[i]=card;
                [self.cards addObject:card];
            }else{
                self=nil;
                break;
            }
            
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index;
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

//#define MISMATCH_PENALTY 2;
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card=[self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen=NO;
        }else{
            //match against other card
            for (Card *othercard in self.cards) {
                if (othercard.isChosen && !othercard.matched) {
                    int matchScore=[card match:@[othercard]];
                    if (matchScore) {
                        self.score+=matchScore*MATCH_BONUS;
                        card.matched=YES;
                        othercard.matched=YES;
                    }else{
                        self.score-=MISMATCH_PENALTY;
                        othercard.chosen=NO;
                    }
                    break;
                }
            }
            self.score-=COST_TO_CHOOSE;
            card.chosen=YES;
        }
    }
}
-(instancetype)init
{
    return nil;
}
@end
