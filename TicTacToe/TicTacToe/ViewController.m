//
//  ViewController.m
//  TicTacToe
//
//  Created by William McDuff on 2015-01-12.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "ViewController.h"

// HOMEWORK

// Center squares on View (done)
// Score label on top that keeps track of wins for each player (HINT: Might need to global instance variables that keeps track of the user scores)
// Make buttons change colors instead of title (reset colors when play again)
// buttons at bottom that resets game scores



@interface ViewController () <UIAlertViewDelegate>


@end

@implementation ViewController {
    
    int player1Wins ;
    int player2Wins;
    
    int playerTurn;
    
    NSMutableArray *squares;
    
    // IF WE DON'T ALLOC INIT IN VIEWDIDLOAD WE CAN ADD BUT IT WON'T DO ANYTHING
    NSMutableArray *buttons;
    
    UILabel * scoreLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    player1Wins = 0;
    player2Wins = 0;
    // Do any additional setup after loading the view, typically from a nib.
    
    scoreLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, 10, self.view.frame.size.width, 40)];
    scoreLabel.text = [NSString stringWithFormat:  @"Player1 Wins: %d, Player2 Wins: %d", player1Wins, player2Wins];
    // scoreLabel.text = @"Player1 Wins: %d, Player2 Wins: %d", player1Wins, player2Wins;
    [self.view addSubview:scoreLabel];
    
   
    UIButton *resetLabelButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 60, self.view.frame.size.height - 70, 120, 40)];
    
    resetLabelButton.backgroundColor = [UIColor redColor];
    [resetLabelButton setTitle:@"resetLabels" forState:UIControlStateNormal];
    [resetLabelButton addTarget:self action:@selector(resetButton:) forControlEvents:UIControlEventTouchUpInside];
    resetLabelButton.tag = 1000;
    [self.view addSubview: resetLabelButton];

    
    
    buttons = [@[] mutableCopy];
    
    playerTurn = 1;
    
    // initialize a mutableArray, with no value for each spot
    
    // AN NSMUTABLEARRAY CAN ONLY HAVE OBJECTS (NO PRIMITIVE TYPES) (THE GETAWAY IS NS IN NSMUTABLEARRAY), WE CAN PUT PRIMITIVES IN SWIFT ARRAYS THOUGH (THEY ARE NOT TECHNICALLY PRIMITIVES)
    squares = [@[
                 @0, @0, @0,
                 @0, @0, @0,
                 @0, @0, @0,
                 ] mutableCopy];
    
    int rowCount = 3;
    int colCount = 3;
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    // the middle - half of our grid (150 because one cell is 100 (so 1 1/2 = 100 + 50))
    CGFloat initialX = self.view.frame.size.width/2 - 150;
    CGFloat initialY = self.view.frame.size.height/2 - 150;
    
    int buttonCount = 0;
    
    // loop per row
    for (int r = 0; r < rowCount; r++) {
        
        
       // loop per column
        for (int c = 0; c < colCount; c++) {
            
            
            // the col number * (width of a spot + the gap)
            CGFloat x = c * (width + 10) + initialX;
            
            // same thing: the r is constant for this loop
            CGFloat y = r * (height + 10) + initialY;
            
            // add button appropriate place and with width and height variables
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
            
            button.backgroundColor = [UIColor blueColor];
            
            button.tag = buttonCount;
            
            // just add a colon in selector if there is an arguement (it knows that we are passing the object as a parameter)
            [button addTarget:self action:@selector(squareTapped:) forControlEvents:UIControlEventTouchUpInside];
            
            
           // [button setTitle:[NSString stringWithFormat:@"%d", buttonCount] forState:UIControlStateNormal];
            
            
            // we can make changes to the button even after we added it to the subview, these changes will show up (because there is still a pointer (in the heap) to it in the subview arrays)
            // also true in swift
            [self.view addSubview:button];
            
            // when we create the button we add it to our array of buttons
            [buttons addObject: button];
            buttonCount++;
            
        }
        
        
    }
    

}


- (void) squareTapped:(UIButton *)button {
    
    // if already played
    if ([squares[button.tag] intValue] != 0) {
        return;
    }
    // THE @ TURNS THE INT INTO AN OBJECT
    squares[button.tag] = @(playerTurn);
    
    if (playerTurn == 1) {
        button.backgroundColor = [UIColor greenColor];
    }
    
    if (playerTurn == 2) {
        button.backgroundColor = [UIColor yellowColor];
    }
 
    
    // if currentPlayer is 2, then playerTurn is 1, else playerTurn is 2
    playerTurn = (playerTurn == 2) ? 1: 2;
    
    [self checkForWin];
    // button.tag is an NSInteger and %d is for integer, so cast as an integer (less memory too because int is a primitive and NSInteger is an object)
    
    
}


- (void) resetButton:(UIButton *)button {
    
    if (button.tag == 1000) {
        
        NSLog(@"clickOnButton");
        player1Wins = 0;
        player2Wins = 0;
        scoreLabel.text = [NSString stringWithFormat:  @"Player1 Wins: %d, Player2 Wins: %d", player1Wins, player2Wins];
        
    }
  
}

-(void) checkForWin {
    
    // an array of arrays
    NSArray *possibilities = @[
                               
                               // rows
                               @[@0, @1, @2],
                               @[@3, @4, @5],
                               @[@6, @7, @8],
                               
                               // columns
                               @[@0, @3, @6],
                               @[@1, @4, @7],
                               @[@2, @5, @8],
                               
                               // diagonals
                               @[@0, @4, @8],
                               @[@2, @4, @6]];

    
    // loop for each possible winning combination (rows, columns and diagonals): (possibility is an whole Array ((with values 0,1,2 (for first))
    for (NSArray *possibility in possibilities) {
        
  
    // possibility is an whole array ((with values 0, 1,2 (for first))
        [self checkPossibility:possibility withPlayer:1];
        [self checkPossibility:possibility withPlayer:2];
        
    }
}

-(void) checkPossibility:(NSArray *)possibility withPlayer:(int)player {
    
    // possibility is an whole Array (with values 0,1,2 (for first))
    // so returns squares[0], squares[1], squares[2] for the first one
    // returns all rows square, all columns squares, all diagonals squares
    // we have playerValue in squares (square[index] = 1 or 2)
    
    BOOL playerInSquare1 = ([squares[[possibility[0] intValue]] intValue] == player);
    BOOL playerInSquare2 = ([squares[[possibility[1] intValue]] intValue] == player);
    BOOL playerInSquare3 = ([squares[[possibility[2] intValue]] intValue] == player);
    
    
    
    
    // if for 3 squares (rows, columns or diagonals) we have the same value, we have a winner
    if (playerInSquare1 && playerInSquare2 && playerInSquare3) {
        
        

        
        NSString *message = [NSString stringWithFormat:@"Player %d Won", player];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Winner" message:message delegate:self cancelButtonTitle:@"Play again Now!" otherButtonTitles:nil, nil];
        [alertView show];
        
        if (player == 1) {
            player1Wins += 1;
            
            scoreLabel.text = [NSString stringWithFormat:  @"Player1 Wins: %d, Player2 Wins: %d", player1Wins, player2Wins];
        }
        
        else {
            
            player2Wins += 1;
            scoreLabel.text = [NSString stringWithFormat:  @"Player1 Wins: %d, Player2 Wins: %d", player1Wins, player2Wins];
            
        }
        
    }
    
}

// if we clicked buttonTitle Play again now

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // for all the button in our subviews, reset the buttons to normal
    for (UIButton *button in buttons) {
        
        [button setTitle:@"" forState:UIControlStateNormal];
        
    }
    
    // reset player and tic tac toe array
    playerTurn = 1;
    
    squares = [@[
                 @0, @0, @0,
                 @0, @0, @0,
                 @0, @0, @0,
                 ] mutableCopy];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
