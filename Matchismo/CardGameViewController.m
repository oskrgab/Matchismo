//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Oscar Cortez on 4/25/14.
//  Copyright (c) 2014 Oscar Cortez. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
@interface CardGameViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController
-(CardMatchingGame *)game
{
    if (!_game)_game=[[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck]];
    return _game;
}

/*
 -(Deck *)deck
 {
 if(!_deck)_deck=[self createDeck];
 return _deck;
 }
 */
-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

/*
 -(void)setFlipCount:(int)flipCount
 {
 _flipCount=flipCount;
 self.flipsLabel.text=[NSString stringWithFormat:@"Flips: %d",self.flipCount];
 NSLog(@"FLips: %d",self.flipCount);
 
 }
 */
- (IBAction)touchCardButton:(UIButton *)sender
{
    
    int cardIndex=[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
    /*
     if ([sender.currentTitle length]) {
     [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
     forState:UIControlStateNormal];
     [sender setTitle:@"" forState:UIControlStateNormal];
     //self.flipCount++;
     
     }else{
     Card *card=[self.deck drawRandomCard];
     if (card) {
     [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
     forState:UIControlStateNormal];
     [sender setTitle:card.contents forState:UIControlStateNormal];
     //self.flipCount++;
     
     }
     }
     */
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex =[self.cardButtons indexOfObject:cardButton];
        Card *card=[self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled=!card.isMatched;
    }
    self.scoreLabel.text=[NSString stringWithFormat:@"Score: %d",self.game.score];
}
-(NSString *)titleForCard:(Card*)card
{
    return card.isChosen ? card.contents:@"";
}
-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen?@"cardfront":@"cardback"];
}

@end
