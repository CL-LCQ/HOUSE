//
//  ProcessDataViewer.h
//  House
//
//  Created by Charles Leclercq on 28/06/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HouseTag.h"

@class HouseTag;

@interface ProcessDataViewer : UIViewController

@property CGFloat sizex;
@property CGFloat sizey;


@property HouseTag *houseTag;
@property UILabel *textlabel;
@property(nonatomic) NSMutableArray *nTags;
@property UILabel *progresslabel;

@end
