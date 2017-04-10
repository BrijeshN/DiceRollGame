//
//  ViewController.h
//  Nayak_Brijesh_Lab3
//
//  Created by Brijesh Nayak on 10/21/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DieView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *rollButton;

// Current score label
@property (strong, nonatomic) IBOutlet UILabel *sumLabel;

//Label that shows whose turn is it, also displays winning message
@property (strong, nonatomic) IBOutlet UILabel *rolledOne;
@property (strong, nonatomic) IBOutlet DieView *dieView;
@property (strong, nonatomic) IBOutlet UIButton *startGame;

@property (strong, nonatomic) IBOutlet UIButton *holdButton;
// Display score of player 1 label
@property (strong, nonatomic) IBOutlet UILabel *player1Label;
// Display score of player 2 label
@property (strong, nonatomic) IBOutlet UILabel *player2Label;
@property (strong, nonatomic) IBOutlet UIProgressView *playerOneProgress;
@property (strong, nonatomic) IBOutlet UIProgressView *playerTwoProgress;



@end

