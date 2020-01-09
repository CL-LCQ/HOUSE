//
//  typeSelectVC.h
//  HOUSE
//
//  Created by Charles Leclercq on 04/09/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tagLibrary.h"
#import <QuartzCore/QuartzCore.h>
#import "Colors.h"

@class  Colors;
@class tagLibrary;

@interface typeSelectVC : UIViewController

@property CGFloat sizex;
@property CGFloat sizey;

@property Colors *colors;
@property tagLibrary *sharedTagLibrary;


@property UIButton *button1;
@property UIButton *button2;
@property UIButton *button3;


@end
