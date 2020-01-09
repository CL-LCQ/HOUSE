//
//  RBLViewController.h
//  SimpleChat
//
//  Created by redbear on 14-4-8.
//  Copyright (c) 2014年 redbear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLE.h"
#import "HouseTag.h"
#import "AddItemVC.h"
#import "tagLibrary.h"
#import "tagViewerVC.h"
#import <QuartzCore/QuartzCore.h>
#import "Colors.h"

@class Colors;
@class  tagViewerVC;
@class HouseTag;
@class tagLibrary;

@interface RBLViewController : UIViewController < BLEDelegate>
{
    BLE *bleShield;
    UIActivityIndicatorView *activityIndicator;
}

@property Colors *colors;
@property CGFloat sizex;
@property CGFloat sizey;

@property UIView *tagView;
@property UIView *houseView;
@property UIView *sumView;

@property HouseTag *houseTag;
@property HouseTag *currentTag;
@property tagLibrary *sharedTagLibrary;

@property UIButton *buttonBar1;

@property int totalPrice;
@property int totalSavings;
@property int totalCO2;

@property UIImageView *background;
@property UIImage *lastTagImage;
@property UILabel *textlabel;
@property UILabel *priceLabel;
@property UILabel *co2Label;
@property UILabel *savingsLabel;

@property UILabel *descriptionLabel;
@property UILabel *info1Label;
@property UILabel *info2Label;
@property UILabel *info3Label;
@property UILabel *warningLabel;


@property UIButton *addItem;
@property UIButton *myItems;
@property UIButton *progressButton;

@property UIView    *bottomView;
@property UIToolbar *bottomBar;

@property(nonatomic) NSMutableArray *nTags;
@property UILabel *progresslabel;

@end
