//
//  DieView.h
//  Nayak_Brijesh_Lab3
//
//  Created by Brijesh Nayak on 10/21/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DieView : UIView

@property (strong, nonatomic) UIImageView *dieImageView;

// Declareing show die image view method
-(void) showDieNumber: (int)num;

@end
