//
//  ViewController.m
//  Nayak_Brijesh_Lab3
//
//  Created by Brijesh Nayak on 10/21/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import "ViewController.h"
#import "DiceDataController.h"
@interface ViewController ()

@end

@implementation ViewController

// Keeps track of current turn score
static int currentTurn;

// Gets the random number from the getDieNumber
int firstNumber;

//  Default player 1 is set to true, and player 2 is flase
static bool player = true;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Once user taps ROLL button do the following
- (IBAction)rollClicked:(id)sender {
    
    // Initilize DiceDateController
    DiceDataController *diceDataController = [[DiceDataController alloc] init];
    
    // Get rendom number from getDieNumber method and set firstNumber equal rendom number between 1 - 6
    firstNumber = [diceDataController getDieNumber];
    
    // Pass firstNumber (1 - 6) and display image based on the number
    [self.dieView showDieNumber:firstNumber];
    
    // After user click Roll, enable New Game button, at this point it's title should be "Tap to Continue"
    
    // Player "1's" turn if player is set to "true"
    if (player == true){
        
        // If firstNumber is not 1, do the following
        if (firstNumber != 1){
            
            // Enable HOLD button if firstNumber is not 1
            _holdButton.enabled = YES;
            
            // Make HOLD button completly visible
            _holdButton.alpha = 1.0;
            
            // Get the firstNumber Value, and store it in to currentTurn and keep adding
            currentTurn += firstNumber;
            
            // Display currentTurn total
            self.sumLabel.text = [NSString stringWithFormat:@"Turn total: %d", currentTurn];
            // Display message to tell user to roll again or hold
            self.rolledOne.text = [NSString stringWithFormat:@"Roll again or hold"];
            
            // If firstNumber is 1, do the following
        } else {
            
            //Enable the "Tap to Continue" button, so player 2 can roll dice
            _startGame.enabled = YES;
            _startGame.alpha = 1.0;
            
            // Disable the hold button, so player can not score
            _holdButton.enabled =NO;
            _holdButton.alpha = 0.3;
            
            // Disable the ROLL button since player 1 rolled 1
            _rollButton.enabled = NO;
            _rollButton.alpha = 0.3;
            
            // Set current turn total to 0
            currentTurn = 0;
            
            // Display message that player 1 lost the turn
            self.rolledOne.text = [NSString stringWithFormat:@"Lose turn! It's now player 2's turn"];
            
            // Set firstNumber to 0
            firstNumber = 0;
            
            // Display Turn total is 0 because player rolled 1
            self.sumLabel.text = [NSString stringWithFormat:@"Turn total: %d", firstNumber];
            
            // Set player to "false" so it's player 2's turn
            player = false;
            
        }
        
        // If player is "false", it's Player 2's turn
    } else {
        
        // If firstNumber is not 1, do this
        if (firstNumber != 1){
            
            // Enable HOLD button if firstNumber is not 1
            _holdButton.enabled = YES;
            
            // Make HOLD button completly visible
            _holdButton.alpha = 1.0;
            
            // Get the firstNumber Value, and store it in to currentTurn and keep adding
            currentTurn += firstNumber;
            
            // Display currentTurn total
            self.sumLabel.text = [NSString stringWithFormat:@"Turn total: %d", currentTurn];
            
            // Display message to tell user to roll again or hold
            self.rolledOne.text = [NSString stringWithFormat:@"Roll again or hold"];
            
        } else {
            
            //Enable the "Tap to Continue" button, so player 1 can roll dice
            _startGame.enabled = YES;
            _startGame.alpha = 1.0;
            
            // Disable the hold button, so player can not score
            _holdButton.enabled =NO;
            _holdButton.alpha = 0.3;
            
            // Disable the ROLL button since player 2 rolled 1
            _rollButton.enabled = NO;
            _rollButton.alpha = 0.3;
            
            // Set current turn total to 0
            currentTurn = 0;
            
            // Display message that player 2 lost the turn
            self.rolledOne.text = [NSString stringWithFormat:@"Lose turn! It's now player 1's turn"];
            
            // Set firstNumber to 0
            firstNumber = 0;
            
            // Display Turn total is 0 because player rolled 1
            self.sumLabel.text = [NSString stringWithFormat:@"Turn total: %d", firstNumber];
            
            // Set player to "false" so it's player 2's turn
            player = true;
            
        }
        
    }
    
}

// Once user taps New Game button do the following
- (IBAction)startGameClicked:(id)sender {
    
    // Disable New Game button and change alpha (Gray button)
    _startGame.enabled = NO;
    _startGame.alpha = 0.3;
    
    // Change New game button name to "Tap to continue"
    [_startGame setTitle:@"Tap to continue" forState:UIControlStateNormal];
    
    //  Once new game button is clicked enable Roll
    _rollButton.enabled = YES;
    _rollButton.alpha = 1.0;

    
    
    // If player is set to "true", display this message
    if(player == true){
        // After new game is clicked display this message
        self.rolledOne.text = [NSString stringWithFormat:@"Player 1's turn - tap Roll to begin"];
        
        // If player is set to "flase", display this message
    } else {
        
        // If it's player 2's turn , display this message
        self.rolledOne.text = [NSString stringWithFormat:@"Player 2's turn - tap Roll to begin"];
        
    }
}

// Once user taps HOLD button do the following
- (IBAction)holdClicked:(id)sender {
    
    // Use static to keep the value of Player 1's last turn
    static int sum = 0;
    
    // Use static to keep the value of Player 2's last turn
    static int sum2 = 0;
    // If player 1 taps HOLD, do the follwing
    
    if(player == true){
        
        
        
        // Set sum value to current turn
        sum += currentTurn;
        
        // Update the player 1 score label
        self.player1Label.text = [NSString stringWithFormat:@"%d",sum];
        
        // Update the progress the bar, divide the curentTurn by 100, so you get number between 0 - 1.0
        self.playerOneProgress.progress += (currentTurn / 100.0);
        
        // Once user holds display scored point for current turn
        self.rolledOne.text = [NSString stringWithFormat:@"%d points scored! It's now player 2's turn", currentTurn];
        
        // Disable the HOLD button so user can not multipy theire score by 2
        _holdButton.enabled = NO;
        _holdButton.alpha = 0.3;
        
        // Disable the Roll button after user tap HOLD
        _rollButton.enabled = NO;
        _rollButton.alpha = 0.3;
        
        // If player 1 taps HOLD enable the "Tap to Continue"
        _startGame.enabled = YES;
        _startGame.alpha = 1.0;
        
        // Set current turn to 0
        currentTurn = 0;
        // Disaplay turn total is 0 after player holds
        self.sumLabel.text = [NSString stringWithFormat:@"Turn total: %d", currentTurn];
        
        // After player 1 HOLD, set player to "false", so player 2 can take turn
        player = false;
        
        // If player 1's score is >= 100
        if(sum >= 100){
            
            // Disaply message that player 1 won
            self.rolledOne.text = [NSString stringWithFormat:@"Congratulations! Player 1 wins!"];
            
            // Set "Tap to continue" button title to "New Game"
            [_startGame setTitle:@"New Game" forState:UIControlStateNormal];
            
            // Reset sum and sum 2 to 0
            sum = 0;
            sum2 = 0;
            
            // Reset curren turn to 0
            currentTurn = 0;
            
            // Reset player 1 and 2's score to 0
            self.player1Label.text = [NSString stringWithFormat:@"%d",sum];
            self.player2Label.text = [NSString stringWithFormat:@"%d",sum2];
            
            // Reset player 1 and 2's progress to 0
            self.playerOneProgress.progress = 0.0;
            self.playerTwoProgress.progress = 0.0;
            
            
        }
        
        
        // Player 2's turn
    } else {
        
        // Set sum value to current turn
        sum2 += currentTurn;
        
        // Update the player 1 score label
        self.player2Label.text = [NSString stringWithFormat:@"%d",sum2];
        
        // Update the progress the bar, divide the curentTurn by 100, so you get number between 0 - 1.0
        self.playerTwoProgress.progress += (currentTurn / 100.0);
        
        // Once user holds display scored point for current turn
        self.rolledOne.text = [NSString stringWithFormat:@"%d points scored! It's now player 1's turn", currentTurn];
        
        // Disable the HOLD button so user can not multipy theire score by 2
        _holdButton.enabled = NO;
        _holdButton.alpha = 0.3;
        
        // Disable the Roll button after user tap HOLD
        _rollButton.enabled = NO;
        _rollButton.alpha = 0.3;
        
        // If player 2 taps HOLD enable the "Tap to Continue"
        _startGame.enabled = YES;
        _startGame.alpha = 1.0;
        
        // Set current turn to 0
        currentTurn = 0;
        
        // Disaplay turn total is 0 after player holds
        self.sumLabel.text = [NSString stringWithFormat:@"Turn total: %d", currentTurn];

        
        // After player 2 HOLD, set player to "false", so player 1 can take turn
        player = true;
        
        // If player 2's score is >= 100
        if(sum2 >= 100){
            
            // Disaply message that player 1 won
            self.rolledOne.text = [NSString stringWithFormat:@"Congratulations! Player 2 wins!"];
            
            // Set "Tap to continue" button title to "New Game"
            [_startGame setTitle:@"New Game" forState:UIControlStateNormal];
            
            // Reset sum and sum2 to 0
            sum = 0;
            sum2 = 0;
            
            // Reset current turn to 0
            currentTurn = 0;
            
            // Reset player 1 and 2's score to 0
            self.player1Label.text = [NSString stringWithFormat:@"%d",sum];
            self.player2Label.text = [NSString stringWithFormat:@"%d",sum2];
            
            // Reset player 1 and 2's progress to 0
            self.playerOneProgress.progress = 0.0;
            self.playerTwoProgress.progress = 0.0;
          
            
        }
        
    }
    
    
}


@end
