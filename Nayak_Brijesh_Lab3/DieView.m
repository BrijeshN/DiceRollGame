//
//  DieView.m
//  Nayak_Brijesh_Lab3
//
//  Created by Brijesh Nayak on 10/21/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import "DieView.h"

@implementation DieView


- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initializing the die image
        
        self.backgroundColor = [UIColor clearColor];
        
        // Changeing dieViewImage size to view size to fit in square
        self.dieImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        // Adding it to this view
        [self addSubview:self.dieImageView];
    }
    return self;
}

-(void) showDieNumber: (int)num{
    // Constructing the filename based on the die number
    NSString *fileName = [NSString stringWithFormat:@"%d.png", num];
    // Setting the uiimageview to the appropriate image
    self.dieImageView.image = [UIImage imageNamed:fileName];
        
}


@end
