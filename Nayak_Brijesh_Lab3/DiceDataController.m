//
//  DiceDataController.m
//  Nayak_Brijesh_Lab3
//
//  Created by Brijesh Nayak on 10/21/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import "DiceDataController.h"

@implementation DiceDataController

// Get random number between 1 - 6
-(int)getDieNumber
{
    int r = (arc4random() % 6) + 1;
    
    return r;
}

@end
