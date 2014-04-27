//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Oscar Cortez on 4/25/14.
//  Copyright (c) 2014 Oscar Cortez. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *playingDeck;
@end

@implementation CardGameViewController

- (Deck *) playingDeck
{
    if (!_playingDeck) {
        _playingDeck = [[PlayingCardDeck alloc]init];
    }
    
    return _playingDeck;
}

-(void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"flipcount changed to %d",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    Card *currentCard;
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        currentCard = [self.playingDeck drawRandomCard];
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:currentCard.contents forState:UIControlStateNormal];
    }
    
    self.flipCount++;
}


@end
